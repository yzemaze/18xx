# frozen_string_literal: true

require 'game_manager'
require 'lib/settings'
require 'lib/storage'
require 'view/chat'
require 'view/game_row'
require 'view/welcome'

module View
  class Home < Snabberb::Component
    include GameManager
    include Lib::Settings

    needs :user
    needs :refreshing, default: nil, store: true

    def render
      type = get_url_param('games') || 'all' # @user ? 'personal' : 'all'
      status = get_url_param('status') || 'active' # @user ? 'active' : 'new'
      personal_games, other_games = @games.partition { |game| user_in_game?(@user, game) }

      children = [
        render_header,
        h(Welcome, show_intro: false), # personal_games.size < 2), # TODO: change condition
        h(Chat, user: @user, connection: @connection),
      ]

      # grouped = other_games.group_by { |game| game['status'] }

      acting = false

      case type
      when :personal
        if personal_games.any? { |game| user_is_acting?(@user, game) }
          acting = true
          personal_games.sort_by! { |game| user_is_acting?(@user, game) ? -game['updated_at'] : 0 }
          # personal_games.sort_by! do |game|
          #   [
          #     user_is_acting?(@user, game) ? -game['updated_at'] : 0,
          #     -game['updated_at'],
          #   ]
          # end
        end
        render_row(children, 'Your Games', personal_games, :personal, status)
      when :hotseat
        hotseat = Lib::Storage
          .all_keys
          .select { |k| k.start_with?('hs_') }
          .map { |k| Lib::Storage[k] }
          .sort_by { |gd| gd[:id] }
          .reverse

        render_row(children, 'Hotseat Games', hotseat, :hotseat) if hotseat.any?
      else
        render_row(children, 'Games', other_games, :all, status)
      end

      `document.title = #{(acting ? '* ' : '') + '18xx.Games'}`
      change_favicon(acting)
      change_tab_color(acting)

      # render_row(children, 'Active Games', grouped['active'], :active)
      # render_row(children, 'Finished Games', grouped['finished'], :finished)

      game_refresh

      destroy = lambda do
        `clearTimeout(#{@refreshing})`
        store(:refreshing, nil, skip: true)
      end

      props = {
        key: 'home_page',
        hook: {
          destroy: destroy,
        },
      }

      h('div#homepage', props, children)
    end

    def game_refresh
      return unless @user
      return if @refreshing

      timeout = %x{
        setTimeout(function(){
          self['$get_games']()
          self['$store']('refreshing', nil, Opal.hash({skip: true}))
        }, 10000)
      }

      store(:refreshing, timeout, skip: true)
    end

    def render_row(children, header, games, type, status = 'active')
      children << h(
        GameRow,
        header: header,
        game_row_games: games,
        status: status,
        type: type,
        user: @user,
      )
    end

    def render_header
      h('div#greeting.card_header', [
        h(:h2, "Welcome#{@user ? ' ' + @user['name'] : ''}!"),
      ])
    end

    def get_url_param(param)
      return if `typeof URLSearchParams === 'undefined'` # rubocop:disable Lint/LiteralAsCondition

      `(new URLSearchParams(window.location.search)).get(#{param})`
    end
  end
end
