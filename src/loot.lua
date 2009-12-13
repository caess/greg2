Greg_Loot_Threshold = 4

local Greg_ItemsToIgnore = {
  -- Badges
  [ 'Emblem of Valor' ]    = true,
  [ 'Emblem of Conquest' ] = true,
  [ 'Emblem of Triumph' ]  = true,
  [ 'Emblem of Frost' ]    = true,

  -- Disenchant results
  [ 'Nexus Crystal' ] = true,
  [ 'Void Crystal' ]  = true,
  [ 'Abyss Crystal' ] = true,

  -- Sartharion
  [ 'Large Satchel of Spoils' ] = true,
  -- Onyxia
  [ 'Ashen Sack of Gems' ] = true,

  -- Legendary fragments
  [ "Fragment of Val'anyr" ] = true,
}

function Greg_AnnounceLoot()
  if UnitIsDead( 'target' ) and UnitIsEnemy( 'player', 'target' ) then
    Greg_PublicSay( "Starting event.  On the corpse of " .. UnitName( 'target' ) .. ", we find the following:" )
  else
    Greg_PublicSay( "Starting event.  In the chest, we find the following:" )
  end

  for index = 1, #Greg_ItemsToClaim do
    local item = Greg_ItemsToClaim[ index ]
    local points = Greg_GetItemCost( item )

    if points then
      Greg_PublicSay( item .. ' - ' .. points .. ' points.' )
    else
      Greg_PublicSay( item .. ' - Unknown.  Please enter point value prior to awarding.' )
    end
  end
end

local function Greg_IsItemInSlotClaimable( slot )
  if LootSlotIsItem( slot ) then
    local _, name, _, rarity = GetLootSlotInfo( slot )

    if rarity >= Greg_Loot_Threshold and Greg_ItemsToIgnore[ name ] == nil then
      return true
    end
  end

  return false
end

local function Greg_AddItemInSlotToClaimList( slot )
  item_index = #Greg_ItemsToClaim + 1
  Greg_ItemsToClaim[ item_index ] = GetLootSlotLink( slot )
end

function Greg_LOOT_OPENED_Handler()
  local number_of_loot_slots = GetNumLootItems()

  if not Greg_ClaimingActive then
    local slot
    for slot = 1, number_of_loot_slots do
      if Greg_IsItemInSlotClaimable( slot ) then
        Greg_ClaimingActive = true
        Greg_AddItemInSlotToClaimList( slot )
      end
    end

    if Greg_ClaimingActive then
      Greg_AnnounceLoot()
    end
  end
end