def cikit_message(ip, host, aliases, is_wsl)
  blue = "\033[1;34m"
  green = "\033[1;32m"
  yellow = "\033[1;33m"
  # The green is a default color for this message output.
  reset = "\033[0m#{green}"

  message = <<-END
    |#{green}Documentation: #{yellow}https://cikit.tools/documentation#{reset}
    |#{green}Changelog: #{yellow}https://cikit.tools/changelog#{reset}
    |#{green}Support: #{yellow}https://cikit.slack.com/messages/support#{reset}
    |
    |#{blue} ██████╗ ██╗    ██╗  ██╗ ██╗ ████████╗#{reset}
    |#{blue}██╔════╝ ██║    ██║ ██╔╝ ██║ ╚══██╔══╝#{reset}
    |#{blue}██║      ██║    █████╔╝  ██║    ██║#{reset}
    |#{blue}██║      ██║    ██╔═██╗  ██║    ██║#{reset}
    |#{blue}╚██████╗ ██║    ██║  ██╗ ██║    ██║#{reset}
    |#{blue} ╚═════╝ ╚═╝    ╚═╝  ╚═╝ ╚═╝    ╚═╝#{reset}
    |
    |#{green}IP address: #{yellow}#{ip}#{reset}
    |#{green}Hostnames:#{reset}
  END

  # Prepend the main host to the list of aliases.
  ([host] + aliases).each do |name|
    message += <<-END
      |#{yellow}- #{name}#{reset}
    END
  end

  if is_wsl
    message += <<-END
      |
      |#{blue}Don't forget to add IP and hostname associations for your#{reset}
      |#{blue}project to the #{yellow}"%SYSTEMROOT%\\system32\\drivers\\etc\\hosts".#{reset}
      |
      |#{blue}Also, make sure you are aware of the other limitations#{reset}
      |#{blue}on WSL: #{yellow}https://cikit.tools/documentation/install-on-wsl/#limitations#{reset}
    END
  end

  message.gsub(/^\s+\|/, '')
end
