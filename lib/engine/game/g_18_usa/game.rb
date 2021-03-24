# frozen_string_literal: true

require_relative '../g_1817/game'
require_relative 'meta'

module Engine
  module Game
    module G18USA
      class Game < G1817::Game
        include_meta(G18USA::Meta)

        CURRENCY_FORMAT_STR = '$%d'

        BANK_CASH = 99_999

        CERT_LIMIT = { 2 => 32, 3 => 21, 4 => 16, 5 => 16, 6 => 13, 7 => 11 }.freeze

        STARTING_CASH = { 2 => 630, 3 => 420, 4 => 315, 5 => 300, 6 => 250, 7 => 225 }.freeze

        CAPITALIZATION = :incremental

        MUST_SELL_IN_BLOCKS = false

        TILES = {
          '6' => 'unlimited',
          '5' => 'unlimited',
          '7' => 'unlimited',
          '8' => 'unlimited',
          '9' => 'unlimited',
          '14' => 'unlimited',
          '15' => 'unlimited',
          '57' => 'unlimited',
          '60' => 'unlimited',
          '63' => 'unlimited',
          '80' => 'unlimited',
          '81' => 'unlimited',
          '82' => 'unlimited',
          '83' => 'unlimited',
          '448' => 'unlimited',
          '544' => 'unlimited',
          '545' => 'unlimited',
          '546' => 'unlimited',
          '592' => 'unlimited',
          '593' => 'unlimited',
          '597' => 'unlimited',
          '611' => 'unlimited',
          '619' => 'unlimited',
          'X01' =>
          {
            'count' => 'unlimited',
            'color' => 'yellow',
            'code' => 'city=revenue:30;path=a:1,b:_0;path=a:3,b:_0;path=a:5,b:_0;label=B',
          },
          'X02' => {
            'count' => 'unlimited',
            'color' => 'yellow',
            'code' => 'city=revenue:30;path=a:1,b:_0;path=a:3,b:_0;path=a:5,b:_0;label=B',
          },
          'X06' => {
            'count' => 'unlimited',
            'color' => 'yellow',
            'code' => 'city=revenue:30;path=a:1,b:_0;path=a:3,b:_0;path=a:5,b:_0;label=B',
          },
          'X03' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'city=revenue:30;path=a:1,b:_0;path=a:3,b:_0;path=a:5,b:_0;label=DFW',
          },
          'X05' => {
            'count' => 1,
            'color' => 'yellow',
            'code' => 'city=revenue:30;path=a:1,b:_0;path=a:2,b:_0;path=a:5,b:_0;label=LA',
          },
          'X10' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:50,slots:2;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0;path=a:5,b:_0;label=DFW',
          },
          'X11' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:50,slots:2;path=a:1,b:_0;path=a:2,b:_0;path=a:5,b:_0;label=LA',
          },
          'X12' => {
            'count' => 1,
            'color' => 'green',
            'code' => 'city=revenue:60,slots:2;city=revenue:60;path=a:0,b:_0;path=a:3,b:_0;path=a:1,b:_1;path=a:2,'\
            'b:_1;label=NY',
          },
          'X13' => {
            'count' => 1,
            'color' => 'brown',
            'code' => 'city=revenue:50,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:5,b:_0;label=CL',
          },
          'X14' => {
            'count' => 1,
            'color' => 'brown',
            'code' => 'city=revenue:80,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0;'\
            'label=DFW',
          },
          'X15' => {
            'count' => 1,
            'color' => 'brown',
            'code' => 'city=revenue:70,slots:3;path=a:0,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0;label=LA',
          },
          'X16' => {
            'count' => 1,
            'color' => 'brown',
            'code' => 'city=revenue:70,slots:4;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;label=NY',
          },
          X17: {
            'count' => 'unlimited',
            'color' => 'gray',
            'code' => 'junction;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;',
          },
          'X18' => {
            'count' => 1,
            'color' => 'gray',
            'code' => 'city=revenue:80,slots:3;path=a:0,b:_0;path=a:1,b:_0;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;'\
            'path=a:5,b:_0;label=DFW',
          },
          X19: {
            'count' => 1,
            'color' => 'gray',
            'code' => 'city=revenue:90,slots:4;path=a:0,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0;label=LA',
          },
          'X30' => {
            'count' => 1,
            'color' => 'gray',
            'code' => 'city=revenue:100,slots:4;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;path=a:5,b:_0;label=NY',
          },
        }.freeze

        LOCATION_NAMES = {
          'A15' => 'Winnipeg',
          'A27' => 'Montreal',
          'B2' => 'Seattle',
          'B8' => 'Helena',
          'B14' => 'Fargo',
          'C3' => 'Portland',
          'C17' => 'Minneapolis',
          'C23' => 'Detroit',
          'C25' => 'Toronto',
          'C29' => 'Boston',
          'D6' => 'Boise',
          'D14' => 'Omaha',
          'D20' => 'Chicago',
          'D24' => 'Cleveland',
          'D28' => 'New York City',
          'E1' => 'San Francisco',
          'E3' => 'Sacramento',
          'E7' => 'Salt Lake City',
          'E11' => 'Denver',
          'E15' => 'Kansas City',
          'E17' => 'St. Louis',
          'E23' => 'Columbus',
          'F20' => 'Louisville',
          'F26' => 'Baltimore',
          'G3' => 'Los Angeles',
          'G7' => 'Pheonix',
          'G11' => 'Santa Fe',
          'G17' => 'Memphis',
          'G27' => 'Norfolk',
          'H8' => 'Tucson',
          'H14' => 'Dallas-Fort Worth',
          'H20' => 'Birmingham',
          'H22' => 'Atlanta',
          'I13' => 'San Antonio',
          'I15' => 'Houston',
          'I19' => 'New Orelans',
          'I25' => 'Jacksonville',
          'J20' => 'Port of New Orleans',
          'J24' => 'Florida',
          'I9' => 'Mexico',
        }.freeze

        MARKET = [
          %w[0l
             0a
             0a
             0a
             42
             44
             46
             48
             50p
             53s
             56p
             59p
             62p
             66p
             70p
             74s
             78p
             82p
             86p
             90p
             95p
             100p
             105p
             110p
             115p
             120s
             127p
             135p
             142p
             150p
             157p
             165p
             172p
             180p
             190p
             200p
             210
             220
             230
             240
             250
             260
             270
             285
             300
             315
             330
             345
             360
             375
             390
             405
             420
             440
             460
             480
             500
             520
             540
             560
             580
             600
             625
             650
             675
             700
             725
             750
             775
             800],
           ].freeze

        PHASES = [
          {
            name: '2',
            train_limit: 4,
            tiles: [:yellow],
            operating_rounds: 2,
            corporation_sizes: [2],
          },
          {
            name: '2+',
            on: '2+',
            train_limit: 4,
            tiles: [:yellow],
            operating_rounds: 2,
            corporation_sizes: [2],
          },
          {
            name: '3',
            on: '3',
            train_limit: 4,
            tiles: %i[yellow green],
            operating_rounds: 2,
            corporation_sizes: [2, 5],
          },
          {
            name: '3+',
            on: '3+',
            train_limit: 4,
            tiles: %i[yellow green],
            operating_rounds: 2,
            corporation_sizes: [2, 5],
          },
          {
            name: '4',
            on: '4',
            train_limit: 3,
            tiles: %i[yellow green],
            operating_rounds: 2,
            corporation_sizes: [5],
          },
          {
            name: '4+',
            on: '4+',
            train_limit: 3,
            tiles: %i[yellow green],
            operating_rounds: 2,
            corporation_sizes: [5],
          },
          {
            name: '5',
            on: '5',
            train_limit: 3,
            tiles: %i[yellow green brown],
            operating_rounds: 2,
            corporation_sizes: [5, 10],
          },
          {
            name: '6',
            on: '6',
            train_limit: 2,
            tiles: %i[yellow green brown],
            operating_rounds: 2,
            corporation_sizes: [10],
          },
          {
            name: '7',
            on: '7',
            train_limit: 2,
            tiles: %i[yellow green brown gray],
            operating_rounds: 2,
            corporation_sizes: [10],
          },
          {
            name: '8',
            on: '8',
            train_limit: 2,
            tiles: %i[yellow green brown gray],
            status: ['no_new_shorts'],
            operating_rounds: 2,
            corporation_sizes: [10],
          },
        ].freeze

        TRAINS = [{ name: '2', distance: 2, price: 100, rusts_on: '4', num: 40 },
                  { name: '2+', distance: 2, price: 100, obsolete_on: '4', num: 4 },
                  { name: '3', distance: 3, price: 250, rusts_on: '6', num: 12 },
                  { name: '3+', distance: 3, price: 250, obsolete_on: '6', num: 2 },
                  { name: '4', distance: 4, price: 400, rusts_on: '8', num: 7 },
                  { name: '4+', distance: 4, price: 400, obsolete_on: '8', num: 1 },
                  { name: '5', distance: 5, price: 600, num: 5 },
                  { name: '6', distance: 6, price: 750, num: 4 },
                  { name: '7', distance: 7, price: 900, num: 3 },
                  {
                    name: '8',
                    distance: 8,
                    price: 1100,
                    num: 40,
                    events: [{ 'type' => 'signal_end_game' }],
                  }].freeze

        COMPANIES = [
          {
            name: 'Pittsburgh Steel Mill',
            value: 40,
            revenue: 0,
            desc: 'Owning corp may place special Pittsburgh yellow tile during tile-laying, '\
                  'regardless of connectivity.  The hex is not reserved, and the power '\
                  'is lost if another company builds there first.',
            sym: 'PSM',
            abilities: [
            {
              type: 'tile_lay',
              hexes: ['F13'],
              tiles: ['X00'],
              when: 'track',
              owner_type: 'corporation',
              count: 1,
            },
          ],
            color: nil,
          },
          {
            name: 'Mountain Engineers',
            value: 40,
            revenue: 0,
            desc: 'Owning company receives $20 after laying a yellow tile in a '\
                  'mountain hex.  Any fees must be paid first.',
            sym: 'ME',
            abilities: [
              {
                type: 'tile_income',
                income: 20,
                terrain: 'mountain',
                owner_type: 'corporation',
                owner_only: true,
              },
            ],
            color: nil,
          },
          {
            name: 'Ohio Bridge Company',
            value: 40,
            revenue: 0,
            desc: 'Comes with one $10 bridge token that may be placed by the owning '\
                  'corp in Louisville, Cincinnati, or Charleston, max one token '\
                  'per city, regardless of connectivity.  Allows owning corp to '\
                  'skip $10 river fee when placing yellow tiles.',
            sym: 'OBC',
            abilities: [
              {
                type: 'tile_discount',
                discount: 10,
                terrain: 'water',
                owner_type: 'corporation',
              },
              {
                type: 'assign_hexes',
                hexes: %w[H3 G6 H9],
                count: 1,
                when: 'owning_corp_or_turn',
                owner_type: 'corporation',
              },
            ],
            color: nil,
          },
          {
            name: 'Union Bridge Company',
            value: 80,
            revenue: 0,
            desc: 'Comes with two $10 bridge token that may be placed by the owning '\
                  'corp in Louisville, Cincinnati, or Charleston, max one token '\
                  'per city, regardless of connectivity..  Allows owning corp to '\
                  'skip $10 river fee when placing yellow tiles.',
            sym: 'UBC',
            abilities: [
              {
                type: 'tile_discount',
                discount: 10,
                terrain: 'water',
                owner_type: 'corporation',
              },
              {
                type: 'assign_hexes',
                hexes: %w[H3 G6 H9],
                count: 2,
                when: 'owning_corp_or_turn',
                owner_type: 'corporation',
              },
            ],
            color: nil,
          },
          {
            name: 'Train Station',
            value: 80,
            revenue: 0,
            desc: 'Provides an additional station marker for the owning corp, awarded at time of purchase',
            sym: 'TS',
            abilities: [
              {
                type: 'additional_token',
                count: 1,
                owner_type: 'corporation',
              },
            ],
            color: nil,
          },
          {
            name: 'Minor Coal 18_usa/mine',
            value: 30,
            revenue: 0,
            desc: 'Comes with one coal 18_usa/mine marker.  When placing a yellow '\
                  'tile in a mountain hex next to a revenue location, can place '\
                  'token to avoid $15 terrain fee.  Marked yellow hexes cannot be '\
                  'upgraded.  Hexes pay $10 extra revenue and do not count as a '\
                  'stop.  May not start or end a route at a coal 18_usa/mine.',
            sym: 'MINC',
            abilities: [
              {
                type: 'tile_lay',
                hexes: %w[B25
                          C20
                          C24
                          E18
                          F15
                          G12
                          G14
                          H11
                          H13
                          H15
                          I8
                          I10],
                tiles: %w[7 8 9],
                free: false,
                when: 'track',
                owner_type: 'corporation',
                count: 1,
              },
            ],
            color: nil,
          },
          {
            name: 'Coal 18_usa/mine',
            value: 60,
            revenue: 0,
            desc: 'Comes with two coal 18_usa/mine markers.  When placing a yellow '\
                  'tile in a mountain hex next to a revenue location, can place '\
                  'token to avoid $15 terrain fee.  Marked yellow hexes cannot be '\
                  'upgraded.  Hexes pay $10 extra revenue and do not count as a '\
                  'stop.  May not start or end a route at a coal 18_usa/mine.',
            sym: 'CM',
            abilities: [
              {
                type: 'tile_lay',
                hexes: %w[B25
                          C20
                          C24
                          E18
                          F15
                          G12
                          G14
                          H11
                          H13
                          H15
                          I8
                          I10],
                tiles: %w[7 8 9],
                free: false,
                when: 'track',
                owner_type: 'corporation',
                count: 2,
              },
            ],
            color: nil,
          },
          {
            name: 'Major Coal 18_usa/mine',
            value: 90,
            revenue: 0,
            desc: 'Comes with three coal 18_usa/mine markers.  When placing a yellow '\
                  'tile in a mountain hex next to a revenue location, can place '\
                  'token to avoid $15 terrain fee.  Marked yellow hexes cannot be '\
                  'upgraded.  Hexes pay $10 extra revenue and do not count as a '\
                  'stop.  May not start or end a route at a coal 18_usa/mine.',
            sym: 'MAJC',
            abilities: [
              {
                type: 'tile_lay',
                hexes: %w[B25
                          C20
                          C24
                          E18
                          F15
                          G12
                          G14
                          H11
                          H13
                          H15
                          I8
                          I10],
                tiles: %w[7 8 9],
                free: false,
                when: 'track',
                owner_type: 'corporation',
                count: 3,
              },
            ],
            color: nil,
          },
          {
            name: 'Minor Mail Contract',
            value: 60,
            revenue: 0,
            desc: 'Pays owning corp $10 at the start of each operating round, as '\
                  'long as the company has at least one train.',
            sym: 'MINM',
            abilities: [
              {
                type: 'revenue_change',
                revenue: 10,
                when: 'has_train',
                owner_type: 'corporation',
              },
            ],
            color: nil,
          },
          {
            name: 'Mail Contract',
            value: 90,
            revenue: 0,
            desc: 'Pays owning corp $15 at the start of each operating round, as '\
                  'long as the company has at least one train.',
            sym: 'MAIL',
            abilities: [
              {
                type: 'revenue_change',
                revenue: 15,
                when: 'has_train',
                owner_type: 'corporation',
              },
            ],
            color: nil,
          },
          {
            name: 'Major Mail Contract',
            value: 120,
            revenue: 0,
            desc: 'Pays owning corp $20 at the start of each operating round, as '\
                  'long as the company has at least one train.',
            sym: 'MAJM',
            abilities: [
              {
                type: 'revenue_change',
                revenue: 20,
                when: 'has_train',
                owner_type: 'corporation',
              },
            ],
            color: nil,
          },
        ].freeze

        CORPORATIONS = [
          {
            float_percent: 20,
            sym: 'A&S',
            name: 'Alton & Southern Railway',
            logo: '1817/AS',
            simple_logo: '1817/AS.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#ee3e80',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'A&A',
            name: 'Arcade and Attica',
            logo: '1817/AA',
            simple_logo: '1817/AA.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#904098',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'Belt',
            name: 'Belt Railway of Chicago',
            logo: '1817/Belt',
            simple_logo: '1817/Belt.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            text_color: 'black',
            color: '#f2a847',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'Bess',
            name: 'Bessemer and Lake Erie Railroad',
            logo: '1817/Bess',
            simple_logo: '1817/Bess.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#16190e',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'B&A',
            name: 'Boston and Albany Railroad',
            logo: '1817/BA',
            simple_logo: '1817/BA.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#ef4223',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'DL&W',
            name: 'Delaware, Lackawanna and Western Railroad',
            logo: '1817/DLW',
            simple_logo: '1817/DLW.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#984573',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'J',
            name: 'Elgin, Joliet and Eastern Railway',
            logo: '1817/J',
            simple_logo: '1817/J.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            text_color: 'black',
            color: '#bedb86',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'GT',
            name: 'Grand Trunk Western Railroad',
            logo: '1817/GT',
            simple_logo: '1817/GT.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#e48329',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'H',
            name: 'Housatonic Railroad',
            logo: '1817/H',
            simple_logo: '1817/H.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            text_color: 'black',
            color: '#bedef3',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'ME',
            name: 'Morristown and Erie Railway',
            logo: '1817/ME',
            simple_logo: '1817/ME.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#ffdea8',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'NYOW',
            name: 'New York, Ontario and Western Railway',
            logo: '1817/W',
            simple_logo: '1817/W.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#0095da',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'NYSW',
            name: 'New York, Susquehanna and Western Railway',
            logo: '1817/S',
            simple_logo: '1817/S.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#fff36b',
            text_color: 'black',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'PSNR',
            name: 'Pittsburgh, Shawmut and Northern Railroad',
            logo: '1817/PSNR',
            simple_logo: '1817/PSNR.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#0a884b',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'PLE',
            name: 'Pittsburgh and Lake Erie Railroad',
            logo: '1817/PLE',
            simple_logo: '1817/PLE.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#00afad',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'PW',
            name: 'Providence and Worcester Railroad',
            logo: '1817/PW',
            simple_logo: '1817/PW.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            text_color: 'black',
            color: '#bec8cc',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'R',
            name: 'Rutland Railroad',
            logo: '1817/R',
            simple_logo: '1817/R.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#165633',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'SR',
            name: 'Strasburg Railroad',
            logo: '1817/SR',
            simple_logo: '1817/SR.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#e31f21',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'UR',
            name: 'Union Railroad',
            logo: '1817/UR',
            simple_logo: '1817/UR.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#003d84',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'WT',
            name: 'Warren & Trumbull Railroad',
            logo: '1817/WT',
            simple_logo: '1817/WT.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#e96f2c',
            reservation_color: nil,
          },
          {
            float_percent: 20,
            sym: 'WC',
            name: 'West Chester Railroad',
            logo: '1817/WC',
            simple_logo: '1817/WC.alt',
            shares: [100],
            max_ownership_percent: 100,
            tokens: [0],
            always_market_price: true,
            color: '#984d2d',
            reservation_color: nil,
          },
        ].freeze

        LAYOUT = :pointy

        PITTSBURGH_PRIVATE_NAME = 'DTC'
        PITTSBURGH_PRIVATE_HEX = 'F14'

        SEED_MONEY = 200
        # Alphabetized. Not sure what official ordering is

        METROPOLITAN_HEXES = %w[G3 E11 H14 H22 I19 D20].freeze

        def setup
          metro = METROPOLITAN_HEXES.sort_by { rand }.take(3)
          metro.each do |i|
            case i
            when 'H14'
              @hexes.find { |h| h.id == i }.lay(@tiles.find { |t| t.name == 'X03' })
            when 'E11'
              # Denver needs to be done at a later date
            when 'G3'
              @hexes.find { |h| h.id == i }.lay(@tiles.find { |t| t.name == 'X05' }.rotate!(3))
            when 'D20'
              @hexes.find { |h| h.id == i }.lay(@tiles.find { |t| t.name == 'X02' }.rotate!(1))
            when 'I19'
              @hexes.find { |h| h.id == i }.lay(@tiles.find { |t| t.name == 'X06' })
            when 'H22'
              @hexes.find { |h| h.id == i }.lay(@tiles.find { |t| t.name == 'X01' })
            end
          end
        end

        def take_loan(entity, loan)
          raise GameError, "Cannot take more than #{maximum_loans(entity)} loans" unless can_take_loan?(entity)

          price = entity.share_price.price
          name = entity.name
          name += " (#{entity.owner.name})" if @round.is_a?(Round::Stock)
          @log << "#{name} takes a loan and receives #{format_currency(loan.amount)}"
          @bank.spend(loan.amount, entity)
          @stock_market.move_left(entity)
          @stock_market.move_left(entity)
          log_share_price(entity, price)
          entity.loans << loan
          @loans.delete(loan)
        end

        OFFBOARD_VALUES = [[20, 30, 40, 50], [20, 30, 40, 60], [20, 30, 50, 60], [20, 30, 50, 60], [20, 30, 60, 90],
                           [20, 40, 50, 80], [30, 40, 40, 50], [30, 40, 50, 60], [30, 50, 60, 80], [30, 50, 60, 80],
                           [40, 50, 40, 40]].freeze

        def optional_hexes
          offboard = OFFBOARD_VALUES.sort_by { rand }
          plain_hexes = %w[B20 B26 C5 C11 C13 C15 D2 D4 D12 D22 E13 E27 F2 F6 F12 F14 G9 G13 G19 G25 H10 H12 H16
                           H24 H26]
          {
            red: {
              ['A27'] => "offboard=revenue:yellow_#{offboard[0][0]}|green_#{offboard[0][1]}"\
              "|brown_#{offboard[0][2]}|gray_#{offboard[0][3]};"\
              'path=a:5,b:_0;path=a:0,b:_0',
              ['J20'] => "offboard=revenue:yellow_#{offboard[1][0]}|green_#{offboard[1][1]}|brown_#{offboard[1][2]}"\
              "|gray_#{offboard[1][3]};path=a:2,b:_0",
              ['I5'] => "offboard=revenue:yellow_#{offboard[2][0]}|green_#{offboard[2][1]}|brown_#{offboard[2][2]}"\
              "|gray_#{offboard[2][3]},groups:Mexico,hide:1;path=a:2,b:_0;path=a:3,b:_0;border=edge:4",
              %w[I7
                 I9] => "offboard=revenue:yellow_#{offboard[2][0]}|green_#{offboard[2][1]}|brown_#{offboard[2][2]}"\
                 "|gray_#{offboard[2][3]},groups:Mexico,hide:1;path=a:2,b:_0;path=a:3,b:_0;border=edge:4;border=edge:1",
              ['I11'] => "offboard=revenue:yellow_#{offboard[2][0]}|green_#{offboard[2][1]}|brown_#{offboard[2][2]}"\
              "|gray_#{offboard[2][3]},groups:Mexico;path=a:2,b:_0;path=a:3,b:_0;path=a:4,b:_0;border=edge:1;"\
              'border=edge:5',
              ['J12'] => "offboard=revenue:yellow_#{offboard[2][0]}|green_#{offboard[2][1]}|brown_#{offboard[2][2]}"\
              "|gray_#{offboard[2][3]},groups:Mexico,hide:1;path=a:3,b:_0;border=edge:2;border=edge:5",
              ['K13'] => "offboard=revenue:yellow_#{offboard[2][0]}|green_#{offboard[2][1]}|brown_#{offboard[2][2]}"\
              "|gray_#{offboard[2][3]},groups:Mexico,hide:1;path=a:3,b:_0;border=edge:2",
            },
            white: {
              %w[E11 G3 H14 I15 H20 H22 F26 C29 D24] => 'city=revenue:0',
              %w[D6 E3 E7 G7 G11 H8 I13 I25 G27 E23] => 'city=revenue:0;icon=image:18_ms/coins',
              %w[C17 E15 E17 F20 G17 I19] => 'city=revenue:0;upgrade=cost:10,terrain:water;icon=image:18_usa/bridge',
              %w[C3
                 D14] => 'city=revenue:0;upgrade=cost:10,terrain:water;icon=image:18_ms/coins;icon=image:18_usa/bridge',
              %w[B28 C27 F4 G5 G23] => 'upgrade=cost:15,terrain:mountain',
              %w[D18 E21 F18 H18] => 'upgrade=cost:10,terrain:water',
              ['B22'] => 'upgrade=cost:20,terrain:lake',
              %w[C7 E9 G21] => 'upgrade=cost:15,terrain:mountain;icon=image:18_usa/mine',
              %w[D16 E5 H6] => 'icon=image:18_usa/mine',
              %w[G15 H4 I17 I21 I23 J14] => 'icon=image:18_usa/oil-derrick',
              %w[E19 F16] => 'icon=image:18_usa/coalcar',
              %w[C9 D8 D10 D26 E25 F8 F10 F22 F24] => 'upgrade=cost:15,terrain:mountain;icon=image:18_usa/coalcar',
              %w[B16 B18] => 'icon=image:18_usa/gnr',
              ['C19'] => 'icon=image:18_usa/gnr;icon=image:18_usa/mine',
              ['B10'] => 'icon=image:18_usa/gnr;icon=image:18_usa/coalcar;icon=image:18_usa/mine',
              ['B12'] => 'icon=image:18_usa/gnr;icon=image:18_usa/coalcar;icon=image:18_usa/oil-derrick',
              ['D20'] => 'icon=image:18_usa/gnr;city=revenue:0',
              %w[B8 B14] => 'icon=image:18_usa/gnr;city=revenue:0;icon=image:18_ms/coins',
              ['B6'] => 'icon=image:18_usa/gnr;upgrade=cost:15,terrain:mountain;icon=image:18_usa/coalcar',
              ['B4'] => 'icon=image:18_usa/gnr;upgrade=cost:10,terrain:water',
              plain_hexes => '',
            },
            gray: {
              ['A15'] => "town=revenue:yellow_#{offboard[3][0]}|green_#{offboard[3][1]}|brown_#{offboard[3][2]}"\
              "|gray_#{offboard[3][3]};path=a:0,b:_0;path=a:5,b:_0",
              ['B2'] => "town=revenue:yellow_#{offboard[4][0]}|green_#{offboard[4][1]}|brown_#{offboard[4][2]}"\
              "|gray_#{offboard[4][3]};path=a:4,b:_0;path=a:5,b:_0",
              ['J24'] => "town=revenue:yellow_#{offboard[5][0]}|green_#{offboard[5][1]}|brown_#{offboard[5][2]}"\
              "|gray_#{offboard[5][3]};path=a:2,b:_0;path=a:3,b:_0",
              ['E1'] => "town=revenue:yellow_#{offboard[6][0]}|green_#{offboard[6][1]}|brown_#{offboard[6][2]}"\
              "|gray_#{offboard[6][3]};path=a:4,b:_0;path=a:5,b:_0;path=a:3,b:_0",
              ['B30'] => 'path=a:1,b:0',
              ['C23'] => 'town=revenue:yellow_30|green_40|brown_50|gray_60;path=a:4,b:_0;path=a:2,b:_0;path=a:0,b:_0',
              ['C25'] => 'town=revenue:yellow_20|green_30|brown_40|gray_50;path=a:1,b:_0;path=a:5,b:_0;path=a:3,b:_0',
            },
            yellow: {
              ['D28'] => 'city=revenue:40;city=revenue:40;path=a:0,b:_0;path=a:1,b:_1;path=a:3,b:_0;label=NY',
            },
            blue: {
              %w[B24 C21] => '',
            },
          }
        end

        def stock_round
          close_bank_shorts
          @interest_fixed = nil

          G18USA::Round::Stock.new(self, [
            Engine::Step::DiscardTrain,
            Engine::Step::HomeToken,
            G1817::Step::BuySellParShares,
          ])
        end

        def operating_round(round_num)
          @interest_fixed = nil
          @interest_fixed = interest_rate
          # Revaluate if private companies are owned by corps with trains
          @companies.each do |company|
            next unless company.owner

            abilities(company, :revenue_change, time: 'has_train') do |ability|
              company.revenue = company.owner.trains.any? ? ability.revenue : 0
            end
          end

          G1817::Round::Operating.new(self, [
            G1817::Step::Bankrupt,
            G1817::Step::CashCrisis,
            G18USA::Step::Loan,
            G1817::Step::SpecialTrack,
            G1817::Step::Assign,
            G1817::Step::Track,
            Engine::Step::Token,
            Engine::Step::Route,
            G18USA::Step::Dividend,
            Engine::Step::DiscardTrain,
            G1817::Step::BuyTrain,
          ], round_num: round_num)
        end
      end
    end
  end
end
