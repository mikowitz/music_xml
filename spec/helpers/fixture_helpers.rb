module FixtureHelpers
  def fixture_file(file_name)
    File.read("./spec/fixtures/#{file_name}.xml").strip
  end
end
