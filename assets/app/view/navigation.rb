# frozen_string_literal: true

require 'view/create_game'
require 'view/logo'

module View
  class Navigation < Snabberb::Component
    needs :app_route, default: nil, store: true
    needs :user, default: nil, store: true

    def render
      if @user
        games_links = [item('Your Games', '/?games=personal&status=active')]
        other_links = [item("Profile (#{@user['name']})", '/profile')]
      else
        games_links = []
        other_links = [item('Signup', '/signup')]
        other_links << item('Login', '/login')
      end

      games_links << item('All Games', '/?games=all&status=new')
      other_links << item('About', '/about')

      props = {
        style: {
          display: 'grid',
          grid: '1fr / auto 1fr',
          marginBottom: '1rem',
          paddingBottom: '1vmin',
          boxShadow: '0 2px 0 0 gainsboro',
        },
      }

      h('div#header', props, [
        h(Logo),
        h(:div, [
          render_links(games_links, 'games_nav'),
          render_links(other_links, 'main_nav'),
        ]),
      ])
    end

    def item(name, href)
      props = {
        attrs: {
          href: href,
        },
        style: {
          margin: '0 1rem',
        },
      }
      h(:a, props, name)
    end

    def render_links(links, nav_id)
      children = links.map do |link|
        link
      end

      nav_props = {
        style: {
          margin: 'auto 0',
        },
      }
      h("nav##{nav_id}", nav_props, children)
    end
  end
end
