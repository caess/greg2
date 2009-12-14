local Greg_CostByRule = {
  Head          = 50.00,
  Neck          = 30.00,
  Shoulder      = 35.00,
  Chest         = 50.00,
  Waist         = 35.00,
  Legs          = 50.00,
  Feet          = 35.00,
  Wrist         = 30.00,
  Hand          = 35.00,
  Ring          = 30.00,
  Trinket       = 30.00,
  Cloak         = 30.00,
  OneHandWeapon = 30.00,
  TwoHandWeapon = 60.00,
  Shield        = 30.00,
  OffHandFrill  = 30.00,
  RangedWeapon  = 60.00,
  Relic         = 12.00,
  Wand          = 12.00,
  Recipe        =  0.00,
  Trophy        = 40.00,
  Other         =  0.00
}

local Greg_RuleByLocation = {
  INVTYPE_HEAD           = 'Head',
  INVTYPE_NECK           = 'Neck',
  INVTYPE_SHOULDER       = 'Shoulder',
  INVTYPE_CHEST          = 'Chest',
  INVTYPE_ROBE           = 'Chest',
  INVTYPE_WAIST          = 'Waist',
  INVTYPE_LEGS           = 'Legs',
  INVTYPE_FEET           = 'Feet',
  INVTYPE_WRIST          = 'Wrist',
  INVTYPE_HAND           = 'Hand',
  INVTYPE_FINGER         = 'Ring',
  INVTYPE_TRINKET        = 'Trinket',
  INVTYPE_CLOAK          = 'Cloak',
  INVTYPE_WEAPON         = 'OneHandWeapon',
  INVTYPE_SHIELD         = 'Shield',
  INVTYPE_2HWEAPON       = 'TwoHandWeapon',
  INVTYPE_WEAPONMAINHAND = 'OneHandWeapon',
  INVTYPE_WEAPONOFFHAND  = 'OneHandWeapon',
  INVTYPE_HOLDABLE       = 'OffHandFrill',
  INVTYPE_RANGED         = 'RangedWeapon',
  INVTYPE_THROWN         = 'RangedWeapon',
  INVTYPE_RANGEDRIGHT    = 'RangedWeapon',
  INVTYPE_RELIC          = 'Relic'
}

local Greg_CustomRulesForItems = {
  -- T7
  -- Foos
  [ 'Breastplate of the Lost Conqueror' ]  = 'Chest',
  [ 'Crown of the Lost Conqueror' ]        = 'Head',
  [ 'Gauntlets of the Lost Conqueror' ]    = 'Hand',
  [ 'Mantle of the Lost Conqueror' ]       = 'Shoulder',
  [ 'Legplates of the Lost Conqueror' ]    = 'Legs',
  [ 'Breastplate of the Lost Protector' ]  = 'Chest',
  [ 'Crown of the Lost Protector' ]        = 'Head',
  [ 'Gauntlets of the Lost Protector' ]    = 'Hand',
  [ 'Mantle of the Lost Protector' ]       = 'Shoulder',
  [ 'Legplates of the Lost Protector' ]    = 'Legs',
  [ 'Breastplate of the Lost Vanquisher' ] = 'Chest',
  [ 'Crown of the Lost Vanquisher' ]       = 'Head',
  [ 'Gauntlets of the Lost Vanquisher' ]   = 'Hand',
  [ 'Mantle of the Lost Vanquisher' ]      = 'Shoulder',
  [ 'Legplates of the Lost Vanquisher' ]   = 'Legs',
  -- Malygos
  [ 'Heroic Key to the Focusing Iris' ]    = 'Neck',
  -- Sartharion
  [ 'Dragon Hide Bag' ]                    = 'Other',

  -- T8
  -- Foos
  [ 'Breastplate of the Wayward Conqueror' ]  = 'Chest',
  [ 'Crown of the Wayward Conqueror' ]        = 'Head',
  [ 'Gauntlets of the Wayward Conqueror' ]    = 'Hand',
  [ 'Mantle of the Wayward Conqueror' ]       = 'Shoulder',
  [ 'Legplates of the Wayward Conqueror' ]    = 'Legs',
  [ 'Breastplate of the Wayward Protector' ]  = 'Chest',
  [ 'Crown of the Wayward Protector' ]        = 'Head',
  [ 'Gauntlets of the Wayward Protector' ]    = 'Hand',
  [ 'Mantle of the Wayward Protector' ]       = 'Shoulder',
  [ 'Legplates of the Wayward Protector' ]    = 'Legs',
  [ 'Breastplate of the Wayward Vanquisher' ] = 'Chest',
  [ 'Crown of the Wayward Vanquisher' ]       = 'Head',
  [ 'Gauntlets of the Wayward Vanquisher' ]   = 'Hand',
  [ 'Mantle of the Wayward Vanquisher' ]      = 'Shoulder',
  [ 'Legplates of the Wayward Vanquisher' ]   = 'Legs',

  -- T9
  -- Foos
  [ 'Trophy of the Crusade' ]         = 'Trophy',
  -- Onyxia
  [ 'Enlarged Onyxia Hide Backpack' ] = 'Other',
  [ 'Head of Onyxia' ]                = 'Other',
}

function Greg_GetItemCost( item )
  local name, _, _, _, _, itemType, itemSubType, _, equipLoc = GetItemInfo( item )

  local rule
  if Greg_CustomRulesForItems[ name ] then
    rule = Greg_CustomRulesForItems[ name ]
  elseif itemType == "Recipe" then
    rule = 'Recipe'
  elseif itemSubType == "Wand" then
    rule = 'Wand'
  else
    rule = Greg_RuleByLocation[ equipLoc ]
  end

  return Greg_CostByRule[ rule ]
end