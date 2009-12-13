require( 'lunit' )
require( '../src/item_costs')
require( '../src/loot' )

module( 'greg_loot', lunit.testcase, package.seeall )

function setup()
  _G[ "Greg_ClaimingActive" ] = false
  _G[ "Greg_ItemsToClaim" ] = {}

  _G[ "LootSlotIsItem" ] = function()
    return true
  end

  _G[ "GetLootSlotLink" ] = function()
    return 'Foo'
  end

  _G[ "Greg_PublicSay" ] = function()
  end

  _G[ "UnitIsDead" ] = function()
  end

  _G[ "UnitIsEnemy" ] = function()
  end

  TextFound = false
end

function test_sanity()
  assert_true( true )
  assert_false( false )
end

function test_loot_handler_with_no_items()
  _G[ 'GetNumLootItems' ] = function()
    return 0
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_items_over_loot_threshold()
  _G[ 'GetNumLootItems' ] = function()
    return 2
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, nil, nil, 4, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_true( Greg_ClaimingActive )
  assert_equal( 2, #Greg_Items_To_Claim )
end

function test_loot_handler_with_only_coins()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ "LootSlotIsItem" ] = function()
    return false
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_only_items_below_loot_threshold()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, nil, nil, 1, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_some_items_over_loot_threshold()
  _G[ 'GetNumLootItems' ] = function()
    return 2
  end

  _G[ 'GetLootSlotInfo' ] = function( slot )
    if slot == 1 then
      return nil, nil, nil, 1, nil
    else
      return nil, nil, nil, 4, nil
    end
  end

  Greg_LOOT_OPENED_Handler()

  assert_true( Greg_ClaimingActive )
  assert_equal( 1, #Greg_ItemsToClaim )
end

function test_loot_handler_when_claiming_already_active()
  _G[ 'GetNumLootItems' ] = function()
    return 2
  end

  _G[ 'GetLootSlotInfo' ] = function( slot )
    if slot == 1 then
      return nil, nil, nil, 1, nil
    else
      return nil, nil, nil, 4, nil
    end
  end

  _G[ 'Greg_ClaimingActive' ] = true
  _G[ 'Greg_Items_To_Claim' ] = { 'Foo', 'Bar' }

  Greg_LOOT_OPENED_Handler()

  assert_true( Greg_ClaimingActive )
  assert_equal( 2, #Greg_Items_To_Claim )
end

function test_announcement_when_claiming_starts()
  _G[ 'GetNumLootItems' ] = function()
    return 2
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, nil, nil, 4, nil
  end

  OldAnnouncedLoot = _G[ 'Greg_AnnounceLoot' ]
  _G[ 'Greg_AnnounceLoot' ] = function()
    AnnounceLootCalled = true
  end

  Greg_LOOT_OPENED_Handler()

  assert_true( Greg_ClaimingActive )
  assert_true( AnnounceLootCalled )

  _G[ 'Greg_AnnounceLoot' ] = OldAnnouncedLoot
end

function test_loot_handler_with_emblem_of_valor()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, 'Emblem of Valor', nil, 4, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_emblem_of_conquest()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, 'Emblem of Conquest', nil, 4, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_emblem_of_triumph()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, 'Emblem of Triumph', nil, 4, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_emblem_of_frost()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, 'Emblem of Frost', nil, 4, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_abyss_crystal()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, 'Abyss Crystal', nil, 4, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_nexus_crystal()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, 'Nexus Crystal', nil, 4, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_void_crystal()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, 'Void Crystal', nil, 4, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_large_satchel_of_spoils()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, 'Large Satchel of Spoils', nil, 4, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_ashen_sack_of_gems()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, 'Ashen Sack of Gems', nil, 4, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_loot_handler_with_fragment_of_valanyr()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, "Fragment of Val'anyr", nil, 5, nil
  end

  Greg_LOOT_OPENED_Handler()

  assert_false( Greg_ClaimingActive )
end

function test_announcement_text()
  _G[ 'GetNumLootItems' ] = function()
    return 2
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, nil, nil, 4, nil
  end

  _G[ 'GetLootSlotLink' ] = function( slot )
    if slot == 1 then
      return "Item 1"
    else
      return "Item 2"
    end
  end

  _G[ 'Greg_PublicSay' ] = function( line )
    if string.find( line, "Starting event%." ) then
      StartingEventFound = true
    elseif string.find( line, "Item 1" ) then
      Item1Found = true
    elseif string.find( line, "Item 2" ) then
      Item2Found = true
    end
  end

  Greg_LOOT_OPENED_Handler()

  assert_true( Greg_ClaimingActive )
  assert_true( StartingEventFound )
  assert_true( Item1Found )
  assert_true( Item2Found )
end

function test_announcement_text_with_dead_mob_targeted()
  _G[ 'GetNumLootItems' ] = function()
    return 2
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, nil, nil, 4, nil
  end

  _G[ 'Greg_PublicSay' ] = function( line )
    if string.find( line, "On the corpse of Yogg%-Saron, we find the following:" ) then
      TextFound = true
    end
  end

  _G[ 'UnitIsDead' ] = function( unit )
    if unit == 'target' then
      return true
    end
  end

  _G[ 'UnitIsEnemy' ] = function( unit, otherUnit )
    if unit == 'player' and otherUnit == 'target' then
      return true
    end
  end

  _G[ 'UnitName' ] = function( unit )
    if unit == 'target' then
      return 'Yogg-Saron'
    end
  end

  Greg_LOOT_OPENED_Handler()

  assert_true( TextFound )
end

function test_announcement_text_with_live_mob_targeted()
  _G[ 'GetNumLootItems' ] = function()
    return 2
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, nil, nil, 4, nil
  end

  _G[ 'Greg_PublicSay' ] = function( line )
    if string.find( line, "In the chest, we find the following:" ) then
      TextFound = true
    end
  end

  _G[ 'UnitIsDead' ] = function( unit )
    if unit == 'target' then
      return false
    end
  end

  _G[ 'UnitIsEnemy' ] = function( unit, otherUnit )
    if unit == 'player' and otherUnit == 'target' then
      return true
    end
  end

  _G[ 'UnitName' ] = function( unit )
    if unit == 'target' then
      return 'Yogg-Saron'
    end
  end

  Greg_LOOT_OPENED_Handler()

  assert_true( TextFound )
end

function test_announcement_text_with_live_pc_targeted()
  _G[ 'GetNumLootItems' ] = function()
    return 2
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, nil, nil, 4, nil
  end

  _G[ 'Greg_PublicSay' ] = function( line )
    if string.find( line, "In the chest, we find the following:" ) then
      TextFound = true
    end
  end

  _G[ 'UnitIsDead' ] = function( unit )
    if unit == 'target' then
      return false
    end
  end

  _G[ 'UnitIsEnemy' ] = function( unit, otherUnit )
    if unit == 'player' and otherUnit == 'target' then
      return false
    end
  end

  _G[ 'UnitName' ] = function( unit )
    if unit == 'target' then
      return 'Phaedra'
    end
  end

  _G[ 'Greg_PublicSay' ]( 'Goo' )
  Greg_LOOT_OPENED_Handler()
  _G[ 'Greg_PublicSay' ]( 'Goo' )

  assert_true( TextFound )
end

function test_announcement_text_with_dead_pc_targeted()
  _G[ 'GetNumLootItems' ] = function()
    return 2
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, nil, nil, 4, nil
  end

  _G[ 'Greg_PublicSay' ] = function( line )
    if string.find( line, "In the chest, we find the following:" ) then
      TextFound = true
    end
  end

  _G[ 'UnitIsDead' ] = function( unit )
    if unit == 'target' then
      return true
    end
  end

  _G[ 'UnitIsEnemy' ] = function( unit, otherUnit )
    if unit == 'player' and otherUnit == 'target' then
      return false
    end
  end

  _G[ 'UnitName' ] = function( unit )
    if unit == 'target' then
      return 'Phaedra'
    end
  end

  _G[ 'Greg_PublicSay' ]( 'Goo' )
  Greg_LOOT_OPENED_Handler()
  _G[ 'Greg_PublicSay' ]( 'Goo' )

  assert_true( TextFound )
end

function test_item_cost_in_announcement_text()
  _G[ 'GetNumLootItems' ] = function()
    return 2
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, nil, nil, 4, nil
  end

  _G[ 'GetLootSlotLink' ] = function( slot )
    return "Item " .. slot
  end

  _G[ 'GetItemInfo' ] = function( item )
    if item == 'Item 1' then
      return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_HEAD'
    else
      return item, nil, nil, nil, nil, 'Armor', 'Cloth', nil, 'INVTYPE_SHOULDER'
    end
  end

  _G[ 'Greg_PublicSay' ] = function( line )
    if string.find( line, "Item 1 %- 50 points." ) then
      Item1PointsFound = true
    elseif string.find( line, "Item 2 %- 35 points." ) then
      Item2PointsFound = true
    end
  end

  Greg_LOOT_OPENED_Handler()

  assert_true( Item1PointsFound )
  assert_true( Item2PointsFound )
end

function test_unknown_item_cost_in_announcement_text()
  _G[ 'GetNumLootItems' ] = function()
    return 1
  end

  _G[ 'GetLootSlotInfo' ] = function()
    return nil, nil, nil, 4, nil
  end

  _G[ 'GetLootSlotLink' ] = function( slot )
    return "Item 1"
  end

  _G[ 'GetItemInfo' ] = function( item )
    return item, nil, nil, nil, nil, 'Miscellaneous', 'Other', nil, ''
  end

  _G[ 'Greg_PublicSay' ] = function( line )
    if string.find( line, "Item 1 %- Unknown.  Please enter point value prior to awarding." ) then
      Item1UnknownFound = true
    end
  end

  Greg_LOOT_OPENED_Handler()

  assert_true( Item1UnknownFound )
end