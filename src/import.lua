local function Greg_ParsePoints( name, points_string )
  local points_iteration_pattern = '%w+: %-?%d+%.%d+'
  local points_split_pattern     = '(%w+): (%-?%d+%.%d+)'
  
  for entry in string.gmatch( points_string, points_iteration_pattern ) do
    local tier, points = string.match( entry, points_split_pattern )
  
    Greg_Standings[ name ][ tier ] = tonumber( points )
  end
end

local function Greg_ParseAlts( name, alts_string )
  local alt_pattern = '%u%a+'
  
  for alt in string.gmatch( alts_string, alt_pattern ) do
    Greg_Alts[ alt ] = name
  end
end

local function Greg_ParseLine( line )
  local line_pattern = '^%s*(%u%a+) | Points: ([^|]+) | Alts: ?([%a, ]*)$'
  local name, points, alts = string.match( line, line_pattern )

  Greg_Standings[ name ] = {}
    
  Greg_ParsePoints( name, points )
  Greg_ParseAlts( name, alts )
end

function Greg_Import( lines )
  Greg_Alts      = {}
  Greg_Standings = {}
  
  for line in string.gmatch( lines, "[^\n]+") do
    if strtrim( line ) ~= '' then
      Greg_ParseLine( line )
    end
  end
end
