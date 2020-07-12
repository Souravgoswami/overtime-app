module ApplicationHelper
	def active?(path)
		"active" if current_page?(path)
	end

	def flash_message_manager
		msg = flash[:notice] || flash[:alert] || flash[:error]
		notify(msg).html_safe if msg
	end

	def notify(msg, btn_msg = 'Ok')
		%Q[<script>notify("#{msg}", "#{btn_msg}" )</script>].html_safe
	end
end
