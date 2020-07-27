module ApplicationHelper
	def admin_types
		%w(AdminUser)
	end

	def active?(path)
		"active" if current_page?(path)
	end

	def flash_message_manager
		msg = flash[:notice] || flash[:alert] || flash[:error]
		notify(msg).html_safe if msg
	end

	def notify(msg, btn_msg = 'Ok')
		javascript_tag %Q[notify("#{msg}", "#{btn_msg}")]
	end

	def status_label(s)
		badge = case s.downcase
			when 'submitted', 'pending' then 'blue-red'
			when 'approved', 'confirmed' then 'green-blue'
			when 'rejected' then 'red-purple'
			else 'red-purple'
		end

		content_tag(:span, s, class: "badge-custom badge-custom-#{badge}")
	end

	def svg_tag(f, svg_class="inine", width: nil, height: nil)
		f = f.then { |x| x.end_with?('.svg') ? x : "#{x}.svg" }
		width = width ? "#{width}px" : "100%"
		height = height ? "#{height}px" : "100%"

		<<~EOF.html_safe
			<div class="#{svg_class}" style="width: #{width} ; height: #{height}%">
				#{IO.read("#{Rails.root}/app/assets/glyphicons/inline-glyphicons/#{f}")}
			</div>
		EOF
	end
end
