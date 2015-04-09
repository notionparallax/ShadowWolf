
def xvfb_run_chrome log
  url = 'http://localhost:9000/#/projects'
  IO.popen("xvfb-run --server-args='-screen 0, 1024x768x24' chromium -start-maximized #{url} --disable-print-preview --disable-web-security") do |data|
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
  tags = nil
  ncat_thread = Thread.new do
    tags = %x(echo blorp | ncat -l 8887 | tail -n1 | jq '.tags[]' --raw-output)
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
  tags.split("\n")
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
    project_number.chomp!
    puts 'Trying project: ' + project_number
    tags = visit project_number
    until tags.empty?
      tag = tags.pop
      puts '  Trying tag: ' + tag
      visit_tag project_number, tag
      print_page "#{project_number}-#{tag}"
    end
  end

  xvfb_run_chrome.kill
end

main
