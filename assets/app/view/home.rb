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
      grouped = {}
      grouped['personal'], other_games = @games.partition { |game| user_in_game?(@user, game) }

      children = [
        render_header,
        h(Welcome, show_intro: grouped['personal'].size < 2),
        h(Chat, user: @user, connection: @connection),
      ]

      # these will show up in the profile page
      grouped['personal'].reject! { |game| game['status'] == 'finished' }

      grouped.merge!(other_games.sort_by { |game| -game['updated_at'] }.group_by { |game| game['status'] })

      # Ready, then active, then unstarted, then completed
      grouped['personal'].sort_by! do |game|
        [
          user_is_acting?(@user, game) ? -game['updated_at'] : 0,
          game['status'] == 'active' ? -game['updated_at'] : 0,
          game['status'] == 'new' ? -game['created_at'] : 0,
          -game['updated_at'],
        ]
      end

      grouped['hotseat'] = Lib::Storage
        .all_keys
        .select { |k| k.start_with?('hs_') }
        .map { |k| Lib::Storage[k] }
        .sort_by { |gd| gd[:id] }
        .reverse

      %w[personal hotseat new active finished].each do |status|
        next unless (title = Lib::Storage["#{status}_filter_title"]) && grouped[status]

        grouped[status].select! { |game| game['title'] == title }
      end

      render_row(children, 'Your Games', grouped['personal'], :personal) if @user && grouped['personal']
      render_row(children, 'Hotseat Games', grouped['hotseat'], :hotseat) if grouped['hotseat']
      render_row(children, 'New Games', grouped['new'], :new) if @user && grouped['new']
      render_row(children, 'Active Games', grouped['active'], :active) if grouped['active']
      render_row(children, 'Finished Games', grouped['finished'], :finished) if grouped['finished']

      game_refresh

      acting = grouped['personal'].any? { |game| user_is_acting?(@user, game) }
      `document.title = #{(acting ? '* ' : '') + '18xx.Games'}`
      change_favicon(acting)
      change_tab_color(acting)

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

    def render_row(children, header, games, type)
      children << h(GameRow, header: header, game_row_games: games, type: type, user: @user)
    end

    def render_header
      h('div#greeting', [
        h(:h2, "Welcome#{@user ? ' ' + @user['name'] : ''}!"),
      ])
    end
  end
end
