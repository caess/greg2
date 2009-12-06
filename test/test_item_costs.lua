require( 'lunit' )
require( '../src/item_costs' )

module( 'greg_item_costs', lunit.testcase, package.seeall )

function test_sanity()
  assert_true( true )
  assert_false( false )
end

function test_head_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_HEAD'
  end
  
  assert_equal( 50.00, Greg_GetItemCost( 'Item' ) )
end

function test_neck_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Miscellaneous', nil, 'INVTYPE_NECK'
  end
  
  assert_equal( 30.00, Greg_GetItemCost( 'Item' ) )
end

function test_shoulder_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_SHOULDER'
  end
  
  assert_equal( 35.00, Greg_GetItemCost( 'Item' ) )
end

function test_chest_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_CHEST'
  end
  
  assert_equal( 50.00, Greg_GetItemCost( 'Item' ) )
end

function test_robe_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_ROBE'
  end
  
  assert_equal( 50.00, Greg_GetItemCost( 'Item' ) )
end

function test_waist_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_WAIST'
  end

  assert_equal( 35.00, Greg_GetItemCost( 'Item' ) )
end

function test_legs_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_LEGS'
  end

  assert_equal( 50.00, Greg_GetItemCost( 'Item' ) )
end

function test_feet_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_FEET'
  end

  assert_equal( 35.00, Greg_GetItemCost( 'Item' ) )
end

function test_wrist_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_WRIST'
  end

  assert_equal( 30.00, Greg_GetItemCost( 'Item' ) )
end

function test_hand_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_HAND'
  end

  assert_equal( 35.00, Greg_GetItemCost( 'Item' ) )
end

function test_ring_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Miscellaneous', nil, 'INVTYPE_FINGER'
  end

  assert_equal( 30.00, Greg_GetItemCost( 'Item' ) )
end

function test_trinket_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Miscellaneous', nil, 'INVTYPE_TRINKET'
  end

  assert_equal( 30.00, Greg_GetItemCost( 'Item' ) )
end

function test_cloak_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Miscellaneous', nil, 'INVTYPE_CLOAK'
  end

  assert_equal( 30.00, Greg_GetItemCost( 'Item' ) )
end

function test_weapon_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Weapon', 'One-Handed Swords', nil, 'INVTYPE_WEAPON'
  end

  assert_equal( 30.00, Greg_GetItemCost( 'Item' ) )
end

function test_shield_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Shields', nil, 'INVTYPE_SHIELD'
  end

  assert_equal( 30.00, Greg_GetItemCost( 'Item' ) )
end

function test_twohanded_weapon_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Weapon', 'Two-Handed Swords', nil, 'INVTYPE_2HWEAPON'
  end

  assert_equal( 60.00, Greg_GetItemCost( 'Item' ) )
end

function test_mainhand_weapon_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Weapon', 'One-Handed Swords', nil, 'INVTYPE_WEAPONMAINHAND'
  end

  assert_equal( 30.00, Greg_GetItemCost( 'Item' ) )
end

function test_offhand_weapon_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Weapon', 'One-Handed Swords', nil, 'INVTYPE_WEAPONOFFHAND'
  end

  assert_equal( 30.00, Greg_GetItemCost( 'Item' ) )
end

function test_offhand_frill_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Miscellaneous', nil, 'INVTYPE_HOLDABLE'
  end

  assert_equal( 30.00, Greg_GetItemCost( 'Item' ) )
end

function test_ranged_weapon_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Weapon', 'Bow', nil, 'INVTYPE_RANGED'
  end

  assert_equal( 60.00, Greg_GetItemCost( 'Item' ) )
end

function test_thrown_weapon_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Weapon', 'Thrown', nil, 'INVTYPE_THROWN'
  end

  assert_equal( 60.00, Greg_GetItemCost( 'Item' ) )
end

function test_rangedright_weapon_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Weapon', 'Bow', nil, 'INVTYPE_RANGEDRIGHT'
  end

  assert_equal( 60.00, Greg_GetItemCost( 'Item' ) )
end

function test_relic_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Armor', 'Relic', nil, 'INVTYPE_RELIC'
  end

  assert_equal( 12.00, Greg_GetItemCost( 'Item' ) )
end

function test_wand_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Weapon', 'Wand', nil, 'INVTYPE_RANGED'
  end

  assert_equal( 12.00, Greg_GetItemCost( 'Item' ) )
end

function test_recipe_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Recipe', nil, nil, ''
  end

  assert_equal( 0.00, Greg_GetItemCost( 'Item' ) )
end

function test_tier_t7_foos_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Miscellaneous', 'Other', nil, ''
  end

  assert_equal( 50.00, Greg_GetItemCost( 'Breastplate of the Lost Conqueror' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Crown of the Lost Conqueror' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Gauntlets of the Lost Conqueror' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Legplates of the Lost Conqueror' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Mantle of the Lost Conqueror' ) )
  
  assert_equal( 50.00, Greg_GetItemCost( 'Breastplate of the Lost Protector' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Crown of the Lost Protector' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Gauntlets of the Lost Protector' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Legplates of the Lost Protector' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Mantle of the Lost Protector' ) )
  
  assert_equal( 50.00, Greg_GetItemCost( 'Breastplate of the Lost Vanquisher' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Crown of the Lost Vanquisher' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Gauntlets of the Lost Vanquisher' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Legplates of the Lost Vanquisher' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Mantle of the Lost Vanquisher' ) )
end

function test_tier_t8_foos_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Miscellaneous', 'Other', nil, ''
  end

  assert_equal( 50.00, Greg_GetItemCost( 'Breastplate of the Wayward Conqueror' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Crown of the Wayward Conqueror' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Gauntlets of the Wayward Conqueror' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Legplates of the Wayward Conqueror' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Mantle of the Wayward Conqueror' ) )
  
  assert_equal( 50.00, Greg_GetItemCost( 'Breastplate of the Wayward Protector' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Crown of the Wayward Protector' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Gauntlets of the Wayward Protector' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Legplates of the Wayward Protector' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Mantle of the Wayward Protector' ) )
  
  assert_equal( 50.00, Greg_GetItemCost( 'Breastplate of the Wayward Vanquisher' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Crown of the Wayward Vanquisher' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Gauntlets of the Wayward Vanquisher' ) )
  assert_equal( 50.00, Greg_GetItemCost( 'Legplates of the Wayward Vanquisher' ) )
  assert_equal( 35.00, Greg_GetItemCost( 'Mantle of the Wayward Vanquisher' ) )
end

function test_tier_t9_foos_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Miscellaneous', 'Other', nil, ''
  end

  assert_equal( 40.00, Greg_GetItemCost( 'Trophy of the Crusade' ) )
end

function test_heroic_key_to_the_focusing_iris_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Miscellaneous', 'Other', nil, ''
  end

  assert_equal( 30.00, Greg_GetItemCost( 'Heroic Key to the Focusing Iris' ) )
end

function test_dragon_hide_bag_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Container', 'Bag', nil, 'INVTYPE_BAG'
  end

  assert_equal( 0.00, Greg_GetItemCost( 'Dragon Hide Bag' ) )
end

function test_enlarged_onyxia_hide_backpack_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Container', 'Bag', nil, 'INVTYPE_BAG'
  end

  assert_equal( 0.00, Greg_GetItemCost( 'Enlarged Onyxia Hide Backpack' ) )
end

function test_head_of_onyxia_cost()
  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Miscellaneous', 'Other', nil, ''
  end

  assert_equal( 0.00, Greg_GetItemCost( 'Head of Onyxia' ) )
end