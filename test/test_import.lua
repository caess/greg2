require( 'lunit' )
require( '../src/import' )

module( 'greg_import', lunit.testcase, package.seeall )

function test_sanity()
  assert_true( true )
  assert_false( false )
end
