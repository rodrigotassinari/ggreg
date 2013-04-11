# encoding: utf-8

# By increasing the logger level, you will be able to reduce the IO during your tests.
# See: http://helabs.com.br/blog/2013/02/06/testes-mais-rapidos-no-rspec/
Rails.logger.level = 4 unless ENV['WITH_LOG']
