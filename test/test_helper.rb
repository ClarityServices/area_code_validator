# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require 'rails'
require 'active_record'
require 'active_support'
require 'minitest/autorun'
require 'minitest/reporters'
require 'area_code_validator'
require 'shoulda'

ActiveSupport.test_order = :sorted
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

configuration = Pathname.new File.expand_path('configuration', File.dirname(__FILE__))
models        = Pathname.new File.expand_path('models', File.dirname(__FILE__))
Dir.glob(models.join('*.rb')).each do |file|
  autoload File.basename(file).chomp('.rb').camelcase.intern, file
end.each do |file|
  require file
end

# Setup ActiveRecord
ActiveRecord::Base.configurations = YAML.load_file configuration.join('database.yml')
ActiveRecord::Base.establish_connection
load configuration.join('schema.rb')

class ActiveSupport::TestCase
  VALID_AREA_CODES = {
      'AL' => ['205', '251', '256', '334', '938'],
      'AK' => ['907'],
      'AZ' => ['480', '520', '602', '623', '928'],
      'AR' => ['479', '501', '870'],
      'CA' => ['209', '213', '310', '323', '408', '415', '424', '442', '510', '530', '559', '562', '619', '626', '650', '657', '661', '707', '714', '747', '760', '805', '818', '831', '858', '909', '916', '925', '949', '951'],
      'CO' => ['303', '719', '720', '970'],
      'CT' => ['203', '475', '860'],
      'DE' => ['302'],
      'DC' => ['202'],
      'FL' => ['239', '305', '321', '352', '386', '407', '561', '727', '754', '772', '786', '813', '850', '863', '904', '941', '954'],
      'GA' => ['229', '404', '470', '478', '678', '706', '762', '770', '912'],
      'HI' => ['808'],
      'ID' => ['208'],
      'IL' => ['217', '224', '309', '312', '331', '618', '630', '708', '773', '779', '815', '847', '872'],
      'IN' => ['219', '260', '317', '574', '765', '812'],
      'IA' => ['319', '515', '563', '641', '712'],
      'KS' => ['316', '620', '785', '913'],
      'KY' => ['270', '502', '606', '859'],
      'LA' => ['225', '318', '337', '504', '985'],
      'ME' => ['207'],
      'MD' => ['240', '301', '410', '443'],
      'MA' => ['339', '351', '413', '508', '617', '774', '781', '857', '978'],
      'MI' => ['231', '248', '269', '313', '517', '586', '616', '734', '810', '906', '947', '989'],
      'MN' => ['218', '320', '507', '612', '651', '763', '952'],
      'MS' => ['228', '601', '662', '769'],
      'MO' => ['314', '417', '573', '636', '660', '816'],
      'MT' => ['406'],
      'NE' => ['308', '402'],
      'NV' => ['702', '775'],
      'NH' => ['603'],
      'NJ' => ['201', '551', '609', '732', '848', '856', '862', '908', '973'],
      'NY' => ['212', '315', '347', '516', '518', '585', '607', '631', '646', '716', '718', '845', '914', '917', '929'],
      'NM' => ['505', '575'],
      'NC' => ['252', '336', '704', '828', '910', '919', '980'],
      'ND' => ['701'],
      'OH' => ['216', '234', '330', '419', '440', '513', '567', '614', '740', '937'],
      'OK' => ['405', '539', '580', '918'],
      'OR' => ['458', '503', '541', '971'],
      'PA' => ['215', '267', '412', '484', '570', '610', '717', '724', '814', '878'],
      'PR' => ['787', '939'],
      'RI' => ['401'],
      'SC' => ['803', '843', '864'],
      'SD' => ['605'],
      'TN' => ['423', '615', '731', '865', '901', '931'],
      'TX' => ['210', '214', '254', '281', '325', '361', '409', '430', '432', '469', '512', '682', '713', '806', '817', '830', '832', '903', '915', '936', '940', '956', '972', '979'],
      'UT' => ['385', '435', '801'],
      'VT' => ['802'],
      'VI' => ['340'],
      'VA' => ['276', '434', '540', '571', '703', '757', '804'],
      'WA' => ['206', '253', '360', '425', '509'],
      'WV' => ['304', '681'],
      'WI' => ['262', '414', '608', '715', '920'],
      'WY' => ['307'] }
end