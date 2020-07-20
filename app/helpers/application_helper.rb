module ApplicationHelper
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
			when 'submitted' then 'primary'
			when 'approved' then 'success'
			when 'rejected' then 'danger'
			else 'warning'
		end

		content_tag(:span, s, class: "badge badge-#{badge}")
	end
end
