#!/usr/bin/ruby -w
SIZES = 8.step(128, 4).to_a
MARGIN = 4

abort("You need to be at the project's / directory before running #{Process.argv0}") unless Dir.exist?('app')

GLYPHICON_DIR = 'app/assets/glyphicons'
scss_file = 'app/assets/stylesheets/glyphicon.css'

ICONS = Dir.children(GLYPHICON_DIR)

files = Dir.children(GLYPHICON_DIR).map! { |x| x.split(?.).tap(&:pop).join(?.) }

css = "/*\n\tIncluded files:\n\t#{files.join(' ')}\n\n\tAvailable sizes:\n\t#{SIZES.join(' ')}\n\n" +
	%[\tUsage example:\n\t<span class="glyphicon#{SIZES.sample} glyphicon-#{files.sample}">Icon beside Text</span>\n*/\n\n] +
	ICONS.map do |i|
		i_basename = i.split(?.).tap(&:pop).join(?.)

		SIZES.map do |s|
			<<~EOF.tap { |x| x.delete!("\t\n") }
				.glyphicon#{s}.glyphicon-#{i_basename}::before{
					content:'';
					padding:#{s}px #{s}px #{s}px 0;
					background:transparent url("#{i}") center center no-repeat;
					background-size:#{s}px;
					margin-right: #{MARGIN}px ;
				}
			EOF
		end
	end.join

Dir.mkdir(GLYPHICON_DIR) unless Dir.exist?(GLYPHICON_DIR)

IO.write(scss_file, css)
# puts IO.read(scss_file)
