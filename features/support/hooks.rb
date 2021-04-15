require 'selenium-webdriver'
require 'report_builder'

at_exit do
    ReportBuilder.configure do |config|
      config.input_path = 'results/report.json'
      config.report_path = 'results/report'
      config.report_types = %i[retry html]
      config.report_title = 'Resultados do Teste'
      config.compress_image = true
      #config.additional_info = { 'App' => 'Web', 'Data de execução' => @current_date }
      config.color = 'indigo'
    end
    ReportBuilder.build_report
  end

  Before do
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    window = Capybara.current_session.current_window
    window.resize_to(1200, 1200)
    window.maximize
  end

  After do |scn|
    # Set reset session hook
    page.execute_script('sessionStorage.clear()')
    Capybara.current_session.driver.quit
  end

