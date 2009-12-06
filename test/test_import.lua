require( 'lunit' )
require( '../src/import' )

module( 'greg_import', lunit.testcase, package.seeall )

function test_sanity()
  assert_true( true )
  assert_false( false )
end

function test_import_without_alts()
  local line_daryn = 'Daryn | Points: t8: -92.40, t10: 0.00, t9: 274.34 | Alts:'
  
  Greg_Import( line_daryn )
  
  assert_table( Greg_Standings, "Greg_Standings is not a table" )
  assert_table( Greg_Standings[ 'Daryn' ], "Greg_Standings[ 'Daryn' ] is not a table." )
  assert_equal( -92.40, Greg_Standings[ 'Daryn' ][ 't8' ], "Daryn's T8 points don't match." )
  assert_equal( 274.34, Greg_Standings[ 'Daryn' ][ 't9' ], "Daryn's T9 points don't match." )
  assert_equal(   0.00, Greg_Standings[ 'Daryn' ][ 't10' ], "Daryn's T10 points don't match." )
end

function test_import_with_one_alt()
  local line_phaedra = 'Phaedra | Points: t8: 345.66, t10: 0.00, t9: 239.20 | Alts: Pari'
  
  Greg_Import( line_phaedra )
  
  assert_table( Greg_Standings, 'Greg_Standings is not a table' )
  assert_table( Greg_Standings[ 'Phaedra' ], "Greg_Standings[ 'Phaedra' ] is not a table." )
  assert_equal( 345.66, Greg_Standings[ 'Phaedra' ][ 't8' ], "Phaedra's T8 points don't match." )
  assert_equal( 239.20, Greg_Standings[ 'Phaedra' ][ 't9' ], "Phaedra's T9 points don't match." )
  assert_equal(   0.00, Greg_Standings[ 'Phaedra' ][ 't10' ], "Phaedra's T10 points don't match." )
  
  assert_table( Greg_Alts, 'Greg_Alts is not a table.' )
  assert_equal( 'Phaedra', Greg_Alts[ 'Pari' ], "Pari isn't marked as Phaedra's alt." )
end

function test_import_with_multiple_alts()
  local line_tahapenes = 'Tahapenes | Points: t8: 496.16, t10: 0.00, t9: 411.20 | Alts: Angelique, Lissanna, Orisella'
  
  Greg_Import( line_tahapenes )
  
  assert_table( Greg_Standings, 'Greg_Standings is not a table' )
  assert_table( Greg_Standings[ 'Tahapenes' ], "Greg_Standings[ 'Tahapenes' ] is not a table." )
  assert_equal( 496.16, Greg_Standings[ 'Tahapenes' ][ 't8' ], "Tahapenes' T8 points don't match." )
  assert_equal( 411.20, Greg_Standings[ 'Tahapenes' ][ 't9' ], "Tahapenes' T9 points don't match." )
  assert_equal(   0.00, Greg_Standings[ 'Tahapenes' ][ 't10' ], "Tahapenes' T10 points don't match." )

  assert_table( Greg_Alts, 'Greg_Alts is not a table.' )
  assert_equal( 'Tahapenes', Greg_Alts[ 'Angelique' ], "Angelique is not marked as Tahapenes' alt." )
  assert_equal( 'Tahapenes', Greg_Alts[ 'Lissanna' ], "Angelique is not marked as Lissanna' alt." )
  assert_equal( 'Tahapenes', Greg_Alts[ 'Orisella' ], "Angelique is not marked as Orisella' alt." )
end

function test_import_with_multiple_lines()
  local lines = [[
  Nynaeve | Points: t8: 476.96, t10: 0.00, t9: 293.70 | Alts: Riselar
  Seiki | Points: t8: 34.64, t10: 0.00, t9: 128.20 | Alts:
  Tahapenes | Points: t8: 496.16, t10: 0.00, t9: 411.20 | Alts: Angelique, Lissanna, Orisella
  Nalyenarie | Points: t8: -39.00, t10: 0.00, t9: -36.00 | Alts:
  Ruddalina | Points: t8: 0.00, t10: 0.00, t9: 36.00 | Alts:
  Alastriona | Points: t8: 41.12, t10: 0.00, t9: 85.50 | Alts:
  Phaedra | Points: t8: 345.66, t10: 0.00, t9: 239.20 | Alts: Pari
]]
  
  Greg_Import( lines )
  
  assert_table( Greg_Standings, 'Greg_Standings is not a table.' )
  assert_table( Greg_Alts, 'Greg_Alts is not a table.' )
  
  -- Nynaeve
  assert_table( Greg_Standings[ 'Nynaeve' ], "Greg_Standings[ 'Nynaeve' ] is not a table." )
  assert_equal( 476.96, Greg_Standings[ 'Nynaeve' ][ 't8' ], "Nynaeve's T8 points don't match." )
  assert_equal( 293.70, Greg_Standings[ 'Nynaeve' ][ 't9' ], "Nynaeve's T9 points don't match." )
  assert_equal(   0.00, Greg_Standings[ 'Nynaeve' ][ 't10' ], "Nynaeve's T10 points don't match." )
  assert_equal( 'Nynaeve', Greg_Alts[ 'Riselar' ], "Riselar is not marked as Nynaeve's alt." )
  
  -- Seiki
  assert_table( Greg_Standings[ 'Seiki' ], "Greg_Standings[ 'Seiki' ] is not a table." )
  assert_equal(  34.64, Greg_Standings[ 'Seiki' ][ 't8' ], "Seiki's T8 points don't match." )
  assert_equal( 128.20, Greg_Standings[ 'Seiki' ][ 't9' ], "Seiki's T9 points don't match." )
  assert_equal(   0.00, Greg_Standings[ 'Seiki' ][ 't10' ], "Seiki's T10 points don't match." )
  
  -- Tahapenes
  assert_table( Greg_Standings[ 'Tahapenes' ], "Greg_Standings[ 'Tahapenes' ] is not a table." )
  assert_equal( 496.16, Greg_Standings[ 'Tahapenes' ][ 't8' ], "Tahapenes' T8 points don't match." )
  assert_equal( 411.20, Greg_Standings[ 'Tahapenes' ][ 't9' ], "Tahapenes' T9 points don't match." )
  assert_equal(   0.00, Greg_Standings[ 'Tahapenes' ][ 't10' ], "Tahapenes' T10 points don't match." )
  assert_equal( 'Tahapenes', Greg_Alts[ 'Angelique' ], "Angelique is not marked as Tahapenes' alt." )
  assert_equal( 'Tahapenes', Greg_Alts[ 'Lissanna' ], "Angelique is not marked as Lissanna' alt." )
  assert_equal( 'Tahapenes', Greg_Alts[ 'Orisella' ], "Angelique is not marked as Orisella' alt." )
  
  -- Nalyenarie
  assert_table( Greg_Standings[ 'Nalyenarie' ], "Greg_Standings[ 'Nalyenarie' ] is not a table." )
  assert_equal( -39.00, Greg_Standings[ 'Nalyenarie' ][ 't8' ], "Nalyenarie's T8 points don't match." )
  assert_equal( -36.00, Greg_Standings[ 'Nalyenarie' ][ 't9' ], "Nalyenarie's T9 points don't match." )
  assert_equal(   0.00, Greg_Standings[ 'Nalyenarie' ][ 't10' ], "Nalyenarie's T10 points don't match." )
  
  -- Ruddalina
  assert_table( Greg_Standings[ 'Ruddalina' ], "Greg_Standings[ 'Ruddalina' ] is not a table." )
  assert_equal(   0.00, Greg_Standings[ 'Ruddalina' ][ 't8' ], "Ruddalina's T8 points don't match." )
  assert_equal(  36.00, Greg_Standings[ 'Ruddalina' ][ 't9' ], "Ruddalina's T9 points don't match." )
  assert_equal(   0.00, Greg_Standings[ 'Ruddalina' ][ 't10' ], "Ruddalina's T10 points don't match." )
  
  -- Alastriona
  assert_table( Greg_Standings[ 'Alastriona' ], "Greg_Standings[ 'Alastriona' ] is not a table." )
  assert_equal(  41.12, Greg_Standings[ 'Alastriona' ][ 't8' ], "Alastriona's T8 points don't match." )
  assert_equal(  85.50, Greg_Standings[ 'Alastriona' ][ 't9' ], "Alastriona's T9 points don't match." )
  assert_equal(   0.00, Greg_Standings[ 'Alastriona' ][ 't10' ], "Alastriona's T10 points don't match." )
  
  -- Phaedra
  assert_table( Greg_Standings[ 'Phaedra' ], "Greg_Standings[ 'Phaedra' ] is not a table." )
  assert_equal( 345.66, Greg_Standings[ 'Phaedra' ][ 't8' ], "Phaedra's T8 points don't match." )
  assert_equal( 239.20, Greg_Standings[ 'Phaedra' ][ 't9' ], "Phaedra's T9 points don't match." )
  assert_equal(   0.00, Greg_Standings[ 'Phaedra' ][ 't10' ], "Phaedra's T10 points don't match." )
  assert_equal( 'Phaedra', Greg_Alts[ 'Pari' ], "Pari isn't marked as Phaedra's alt." )
end
