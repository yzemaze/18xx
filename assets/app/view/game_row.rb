# frozen_string_literal: true

require 'game_manager'
require 'lib/storage'
require 'view/game_card'

module View
  class GameRow < Snabberb::Component
    include GameManager

    needs :header
    needs :game_row_games
    needs :user
    needs :type

    LIMIT = 12

    def render
      @limit = @type == :personal ? 24 : LIMIT
      h("div##{@type}.game_row", { key: @header }, [
        render_header(@header),
        *render_row,
      ])
    end

    def render_header(header)
      children = [h(:h2, header)]
      total_games = @game_row_games.size
      p = [page.to_i, (total_games / @limit).floor].min
      @offset = p * @limit
      children << render_more('Prev', "?#{@type}=#{p - 1}") if p.positive?
      children << render_more('Next', "?#{@type}=#{p + 1}") if total_games > @offset + @limit
      children << render_filter

      props = {
        style: {
          display: 'grid',
          grid: '1fr / 11.5rem 3rem 3rem 10rem 1fr',
          gap: '1rem',
          alignItems: 'center',
        },
      }

      h(:div, props, children)
    end

    def render_more(text, params)
      click = lambda do
        get_games(params)
        store(:app_route, "#{@app_route.split('?').first}#{params}")
      end
      props = {
        attrs: {
          href: params,
          onclick: 'return false',
        },
        on: {
          click: click,
        },
        style: {
          justifySelf: 'center',
          gridColumnStart: text == 'Next' ? '3' : '2',
        },
      }

      h("a.#{text.downcase}", props, text)
    end

    def render_filter
      filter = "#{@type}_filter_title"
      filter_games = lambda do
        val = Native(@inputs[filter]).elm.value
        val == 'all' ? Lib::Storage.delete(filter) : Lib::Storage[filter] = val
        update
      end

      titles = [h(:option, { attrs: { value: 'all' } }, 'All Titles')] +
                Engine::VISIBLE_GAMES.sort.map do |game|
                  props = { attrs: { value: game.title } }
                  props[:attrs][:selected] = 'true' if Lib::Storage[filter] == game.title
                  h(:option, props, game.title)
                end
      input_props = {
        attrs: {
          id: filter,
          type: 'text',
        },
        style: { gridColumnStart: 4 },
        on: { input: filter_games },
      }
      @inputs = {}

      @inputs[filter] = h(:select, input_props, titles)
    end

    def render_row
      if @game_row_games.any?
        @game_row_games[@offset, @limit].map { |game| h(GameCard, gdata: game, user: @user) }
      else
        [h(:div, 'No games to display')]
      end
    end

    private

    def page
      return 0 if `typeof URLSearchParams === 'undefined'` # rubocop:disable Lint/LiteralAsCondition

      `(new URLSearchParams(window.location.search)).get(#{@type})` || 0
    end
  end
end
