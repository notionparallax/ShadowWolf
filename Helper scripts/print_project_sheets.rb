require 'json'

def xvfb_run_chrome log
  url = 'http://localhost:9000/#/projects'
  IO.popen("xvfb-run --server-args='-screen 0, 1024x768x24' chromium --start-maximized #{url} --disable-web-security") do |data|
    while line = data.gets
      log.write line
    end
  end
end

def xsend keys, options={}
  if options[:window]
    window = "-window #{options[:window].chomp}"
    puts window.inspect
  else
    window = ''
  end
  keys.each do |key|
    %x(xsendkey #{window} -display :99 #{key})
    sleep 0.02
  end
end

class String
  def sanitize
    raise self + ': sanitize for single characters only' if self.length > 1
    if self.match(/[A-Z]/)
      'Shift+' + self
    elsif self.match(/ /)
      'space'
    elsif self.match(/\?/)
      'Shift+question'
    elsif self.match(/=/)
      'equal'
    elsif self.match(/:/)
      'Shift+colon'
    elsif self.match(/\//)
      'slash'
    elsif self.match(/#/)
      'Shift+3'
    else
      self
    end
  end
  def prep
    self.split('').reject { |c| c == "\n" }.map(&:sanitize)
  end
end

def visit_tag project_number, tag
  msg = nil
  ncat_thread = Thread.new do
    msg = JSON.parse %x(echo blorp | ncat -l 8887 | tail -n1)
  end
  xsend %w(Control+L)
  sleep 0.2
  xsend %w(BackSpace)
  sleep 0.2
  xsend "http://localhost:9000/#/projects/".prep
  xsend project_number.prep
  xsend "?batchPrinting=#{tag}".prep
  xsend %w(Return)
  ncat_thread.join
  msg
end

def find_window_id name
  window_id = nil
  while window_id.nil?
    output = %x(xwininfo -display :99 -name "#{name}" | grep 'Window id:' | awk '{print $4}')
    if not output.empty?
      window_id = output
    else
      puts %x(xwininfo -display :99 -root -tree)
      sleep 0.5
    end
  end
  window_id
end
def until_window_appears name
  while %x(xwininfo -display :99 -name "#{name}" | grep 'Window id:' | awk '{print $4}').empty?
    yield
  end
end

def print_with_preview filename
  %x(rm -f #{Dir.home}/ShadowWolf.pdf)
  xsend %w(Control+P)
  sleep 0.5
  until_window_appears 'Save File' do
    xsend %w(Return)
    sleep 1
  end
  window_id = find_window_id 'Save File'
  xsend %w(Return), window: window_id
  dest = "project-sheets/#{filename}.pdf"
  puts 'dest: ' + dest.inspect
  sleep 2
  %x(mv #{Dir.home}/ShadowWolf.pdf '#{dest}')
end
def print_page filename
  %x(rm -f #{Dir.pwd}/output.pdf)
  xsend %w(Control+P)
  sleep 0.5
  window_id = %x(xwininfo -display :99 -name Print | grep 'Window id:' | awk '{print $4}')
  xsend %w(Tab Return), window: window_id
  sleep 1.5
  dest = "project-sheets/#{filename}.pdf"
  puts 'dest: ' + dest.inspect
  %x(mv #{Dir.pwd}/output.pdf '#{dest}')
end

def visit project_number
  visit_tag project_number, 'main'
end

def main
  log = File.open(ARGV[0] || 'print_project_sheets.log','w')
  ARGV.shift #stdout is project_numbers
  xvfb_thread = Thread.new { xvfb_run_chrome log }
  puts 'Waiting for xvfb...'
  sleep 5

  ARGF.each do |project_number|
    tags = []
    project_number.chomp!
    puts 'Trying project: ' + project_number
    msg = visit( project_number )
    puts JSON.pretty_generate(msg)
    tags = msg['tags']
    until tags.empty?
      puts '  Tags: ' + tags.to_s
      tag = tags.pop
      puts '  Trying tag: ' + tag
      visit_tag project_number, tag
      sleep 1
      print_with_preview "#{project_number}-#{tag}"
    end
  end

  xvfb_run_chrome.kill
end

main
