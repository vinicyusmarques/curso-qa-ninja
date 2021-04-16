require 'report_builder'
Before do
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    window = Capybara.current_session.current_window
    window.resize_to(1200, 1200)
    window.maximize
end

After do |scn|
    binding.pry if scn.failed? && ENV['debug']
    # Setting Screenshot
    temp_shot = page.save_screenshot('results/temp_shot.png')
    screenshot = Base64.encode64(File.open(temp_shot, 'rb').read)
    embed(screenshot, 'image/png', 'Screenshot')
    # Set reset session hook
    page.execute_script('sessionStorage.clear()')
    Capybara.current_session.driver.quit
    @session.driver.quit unless @session.nil?
end

at_exit do
    ReportBuilder.configure do |config|
      config.input_path = 'results/report.json'
      config.report_path = 'results/report'
      #config.report_path = 'relatório de teste'
      config.report_types = %i[html]
      config.report_title = 'Relatório dos testes'
      config.additional_info = { 'Navegador' => 'Web' }
    end
    ReportBuilder.build_report
end