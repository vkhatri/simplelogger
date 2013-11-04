# Author: vkhatri (Virender Khatri)
#
# Description: A Simple Ruby Logger module with colorful console logging support 
#


require 'rubygems'
require 'term/ansicolor'
require 'time'
require 'etc'

class Simplelogger

  attr_reader :hostname, :color, :logfile, :options, :user
  attr_accessor :enable_verbose, :enable_debug, :enable_nocolor, :enable_uuencode, :console_style, :time_format, :program_name

  def initialize(opts = {})
    # Options:
    #   :file => string
    #     log file name
    #   :program_name => string
    #     program name
    #   :enable_debug => boolean
    #     display and log debug messages, default no logging to console & file
    #   :enable_nocolor => boolean
    #     disable colorful messages on console, default enabled
    #   :enable_verbose => boolean
    #     display messages on console (except debug), default messages are only logged to the log file
    #   :enable_uuencode => boolean
    #     uuencode log messages
    #   :time_format => string
    #     user time format, e.g. "%Y-%m-%d_%H-%M-%S", default set to iso8601
    #
    #   :console_style => string 
    #     'full' -> display full log message on console
    #     'message' -> display log level + log message on console
    #     default set to 'full'
    #   

    raise "missing :file option" if not opts[:file]
    @logfile = File.new(opts[:file], "a") ; @logfile.sync = true

    @options = opts
    @color = Term::ANSIColor
    $stdout.sync = true
    @hostname = ENV['HOSTNAME'] || 'unknown_hostname'
    @user = Etc.getlogin || 'unknown_user'

    @time_format = opts[:time_format]
    @program_name = opts[:program_name] || 'unknown_program'
    @console_style = opts[:console_style] || 'full'
    @enable_verbose = opts[:enable_verbose]
    @enable_debug = opts[:enable_debug]
    @enable_uuencode = opts[:enable_uuencode]
    @enable_nocolor = opts[:enable_nocolor]
  end

  def close
    logfile.close if logfile.closed?
  end

  def current_time
    if time_format
      Time.new.strftime(time_format)
    else
      Time.now.iso8601(5)
    end
  end

  def uuencode(string)
    if enable_uuencode
      [string].pack("u")
    else
      string
    end
  end

  def log(level, string)
    string = uuencode(string)
    message = "#{current_time} #{hostname} #{user} #{program_name} #{level}: #{string}"
    logfile.puts message
    message = "#{level}: #{string}" if console_style == 'message'
    if enable_verbose
      if enable_nocolor
        puts message
      else
        case level
        when 'INFO'
          puts color.green message
        when 'WARNING'
          puts color.yellow message
        when 'ERROR'
          puts color.red message
        when 'FATAL'
          puts color.red message
        when 'NOTICE'
          puts color.blue message
        when 'INIT'
          puts color.bold(color.blue(message))
        when 'SUCCESS'
          puts color.green message
        when 'FAILURE'
          puts color.red message
        else
          puts message
        end
      end
    end
  end

  def info(string)
    string = uuencode(string)
    log('INFO',string)
  end

  def debug(string)
    # Default debug messages are not logged, kept it out of 'log'
    if enable_debug
      string = uuencode(string)
      message = "#{current_time} #{hostname} #{user} #{program_name} DEBUG: #{string}"
      logfile.puts message
      message = "DEBUG: #{string}" if console_style == 'message'
      if enable_nocolor
        puts messages
      else
        puts color.magenta message
      end
    end 
  end

  def warning(string)
    string = uuencode(string)
    log('WARNING',string)
  end

  def error(string)
    string = uuencode(string)
    log('ERROR',string)
  end

  def fatal(string)
    string = uuencode(string)
    log('FATAL',string)
  end

  def notice(string)
    string = uuencode(string)
    log('NOTICE',string)
  end

  def init(string)
    string = uuencode(string)
    log('INIT',string)
  end

  def success(string)
    string = uuencode(string)
    log('SUCCESS',string)
  end

  def fail(string)
    string = uuencode(string)
    log('FAILURE',string)
  end

  def underscore(string)
    string = uuencode(string)
    puts color.underscore string
  end

  def stderr(string)
    string = uuencode(string)
    $stderr.write string
  end

  def stdout(string)
    string = uuencode(string)
    $stdout.write string
  end

  def _puts(string)
    string = uuencode(string)
    puts string
  end

  def _print(string)
    string = uuencode(string)
    print string
  end

end
