<%= @variable.errors.full_messages.first if @variable.errors.any?%>



last resort! Incude other error class as well(EG active record etc)
rescue_from Exception, with :something_broke

private
def something_broke
        redirect_to root_url, alert: "This guy doesn't know anything!"
    end
end
