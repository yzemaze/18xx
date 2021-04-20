# frozen_string_literal: true

require 'view/game/part/base'

module View
  module Game
    module Part
      module SmallItem
        REDUCED_WEIGHT = 0.25

        SI_CENTER = {
          region_weights: Base::CENTER,
          x: 0,
          y: 0,
        }.freeze

        SI_UPPER_LEFT_CORNER = {
          region_weights: Base::UPPER_LEFT_CORNER,
          x: -35,
          y: -60,
        }.freeze

        SI_UPPER_RIGHT_CORNER = {
          region_weights: Base::UPPER_RIGHT_CORNER,
          x: 35,
          y: -60,
        }.freeze

        SI_LEFT_CORNER = {
          region_weights: Base::LEFT_CORNER,
          x: -75,
          y: 0,
        }.freeze

        SI_RIGHT_CORNER = {
          region_weights: Base::RIGHT_CORNER,
          x: 75,
          y: 0,
        }.freeze

        SI_BOTTOM_LEFT_CORNER = {
          region_weights: Base::BOTTOM_LEFT_CORNER,
          x: -35,
          y: 60,
        }.freeze

        SI_BOTTOM_RIGHT_CORNER = {
          region_weights: Base::BOTTOM_RIGHT_CORNER,
          x: 35,
          y: 60,
        }.freeze

        SI_WIDE_UPPER_EDGE = {
          region_weights: [0, 1, 2, 3, 4],
          x: 0,
          y: -60,
        }.freeze

        SI_WIDE_BOTTOM_EDGE = {
          region_weights: [19, 20, 21, 22, 23],
          x: 0,
          y: 60,
        }.freeze

        SI_UPPER_EDGE = {
          region_weights: { [2] => 1, [1, 3] => REDUCED_WEIGHT },
          x: 0,
          y: -60,
        }.freeze

        SI_UPPER_LEFT_EDGE = {
          region_weights: { [6] => 1, [0, 5] => REDUCED_WEIGHT },
          x: -50,
          y: -45,
        }.freeze

        SI_UPPER_RIGHT_EDGE = {
          region_weights: { [10] => 1, [4, 11] => REDUCED_WEIGHT },
          x: -50,
          y: -45,
        }.freeze

        SI_BOTTOM_LEFT_EDGE = {
          region_weights: { [13] => 1, [12, 19] => REDUCED_WEIGHT },
          x: -50,
          y: 45,
        }.freeze

        SI_BOTTOM_RIGHT_EDGE = {
          region_weights: { [17] => 1, [18, 23] => REDUCED_WEIGHT },
          x: -50,
          y: 45,
        }.freeze

        SI_BOTTOM_EDGE = {
          region_weights: { [21] => 1, [20, 22] => REDUCED_WEIGHT },
          x: 0,
          y: 60,
        }.freeze

        SIP_UPPER_CORNER = {
          region_weights: Base::UPPER_LEFT_CORNER,
          x: -0,
          y: -75,
        }.freeze

        SIP_UPPER_LEFT_CORNER = {
          region_weights: Base::LEFT_CORNER,
          x: -65,
          y: -37.5,
        }.freeze

        SIP_UPPER_RIGHT_CORNER = {
          region_weights: Base::UPPER_RIGHT_CORNER,
          x: 65,
          y: -37.5,
        }.freeze

        SIP_BOTTOM_LEFT_CORNER = {
          region_weights: Base::BOTTOM_LEFT_CORNER,
          x: -65,
          y: 37.5,
        }.freeze

        SIP_BOTTOM_RIGHT_CORNER = {
          region_weights: Base::RIGHT_CORNER,
          x: 65,
          y: 37.5,
        }.freeze

        SIP_BOTTOM_CORNER = {
          region_weights: Base::BOTTOM_RIGHT_CORNER,
          x: 0,
          y: 75,
        }.freeze

        SIP_UPPER_LEFT_EDGE = {
          region_weights: { [6] => 1, [0, 5] => REDUCED_WEIGHT },
          x: -30,
          y: 45,
        }.freeze

        SIP_UPPER_RIGHT_EDGE = {
          region_weights: { [2] => 1, [1, 3] => REDUCED_WEIGHT },
          x: 30,
          y: 45,
        }.freeze

        SIP_LEFT_EDGE = {
          region_weights: { [13] => 1, [12, 19] => REDUCED_WEIGHT },
          x: -60,
          y: 0,
        }.freeze

        SIP_RIGHT_EDGE = {
          region_weights: { [10] => 1, [4, 11] => REDUCED_WEIGHT },
          x: 60,
          y: 0,
        }.freeze

        SIP_BOTTOM_LEFT_EDGE = {
          region_weights: { [21] => 1, [20, 22] => REDUCED_WEIGHT },
          x: -30,
          y: -45,
        }.freeze

        SIP_BOTTOM_RIGHT_EDGE = {
          region_weights: { [17] => 1, [18, 23] => REDUCED_WEIGHT },
          x: 30,
          y: -45,
        }.freeze

        SIP_WIDE_UPPER_CORNER = {
          region_weights: [0, 1, 2, 3, 5, 6],
          x: 0,
          y: -65,
        }.freeze

        SIP_WIDE_BOTTOM_CORNER = {
          region_weights: [17, 18, 20, 21, 22, 23],
          x: 0,
          y: 65,
        }.freeze

        SIP_TALL_LEFT_CORNER = {
          region_weights: [12, 13, 14, 19],
          x: -60,
          y: 0,
        }.freeze

        SIP_TALL_RIGHT_CORNER = {
          region_weights: [4, 9, 10, 11],
          x: 60,
          y: 0,
        }.freeze

        SIP_WIDER_UPPER_CORNER = {
          region_weights: [4, 10, 12, 13],
          x: 0,
          y: -16,
        }.freeze

        SIP_WIDER_BOTTOM_CORNER = {
          region_weights: [10, 11, 13, 19],
          x: 0,
          y: 16,
        }.freeze

        SIP_WIDE_BOTTOM_LEFT_CORNER = {
          region_weights: [13, 14, 15, 19],
          x: -52,
          y: 25,
        }.freeze

        SMALL_ITEM_LOCATIONS = [
          SI_CENTER,
          SI_LEFT_CORNER,
          SI_RIGHT_CORNER,
          SI_UPPER_LEFT_CORNER,
          SI_UPPER_RIGHT_CORNER,
          SI_BOTTOM_LEFT_CORNER,
          SI_BOTTOM_RIGHT_CORNER,
          SI_UPPER_EDGE,
          SI_UPPER_LEFT_EDGE,
          SI_UPPER_RIGHT_EDGE,
          SI_BOTTOM_LEFT_EDGE,
          SI_BOTTOM_RIGHT_EDGE,
          SI_BOTTOM_EDGE,
        ].freeze

        POINTY_SMALL_ITEM_LOCATIONS = [
          SI_CENTER,
          SIP_UPPER_CORNER,
          SIP_UPPER_LEFT_CORNER,
          SIP_UPPER_RIGHT_CORNER,
          SIP_BOTTOM_LEFT_CORNER,
          SIP_BOTTOM_RIGHT_CORNER,
          SIP_BOTTOM_CORNER,
          SIP_UPPER_LEFT_EDGE,
          SIP_UPPER_RIGHT_EDGE,
          SIP_LEFT_EDGE,
          SIP_RIGHT_EDGE,
          SIP_BOTTOM_LEFT_EDGE,
          SIP_BOTTOM_RIGHT_EDGE,
        ].freeze

        WIDE_ITEM_LOCATIONS = [
          SIP_WIDE_UPPER_CORNER,
          SIP_WIDE_BOTTOM_CORNER,
        ].freeze

        POINTY_WIDE_ITEM_LOCATIONS = [
          SIP_WIDE_UPPER_CORNER,
          SIP_WIDE_BOTTOM_CORNER,
          SIP_WIDE_BOTTOM_LEFT_CORNER,
        ].freeze

        POINTY_TALL_ITEM_LOCATIONS = [
          SIP_TALL_LEFT_CORNER,
          SIP_TALL_RIGHT_CORNER,
        ].freeze

        POINTY_WIDER_ITEM_LOCATIONS = [
          SIP_WIDER_BOTTOM_CORNER,
          SIP_WIDER_UPPER_CORNER,
        ].freeze
      end
    end
  end
end
