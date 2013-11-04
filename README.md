simplelogger
============

simplelogger is a simple Ruby file &amp; console message logger 


* Log messages to file, console, STDOUT, STDERR, ..
* Log levels are standard in addition of few new
* Support uuencoded message logging
* Logs different message severity with different color coding 


## Install

    sudo gem install simplelogger

## Getting Started

    require 'rubygems'
    require 'simplelogger'

    options = {:file => 'lof_file_name', options ..}
    log = SimpleLogger.new(options)
    log.info "message"
    log.warning "message"
    log.error "message"
    log.fatal "message"
    log.debug "message"
    log.notice "message"
    log.success "message"
    log.fail "message"
    log.underscore 'underscore message'
    
    # Print console message with color using Term::Ansicolor 
    puts log.color.red 'i am red'
    
    log.stdout 'standard output'
    log.stderr 'standard error output'
    log._puts 'just puts'
    log._print 'just print'
		
    log.close

## Options

    :file => string
        log file name

    :program_name => string
        program name

    :enable_debug => boolean
        display and log debug messages, default no logging to console & file

    :enable_nocolor => boolean
        disable colorful messages on console, default enabled

    :enable_verbose => boolean
        display messages on console (except debug), default messages are only logged to the log file

    :enable_uuencode => boolean
        uuencode log messages

    :time_format => string
        user time format, e.g. "%Y-%m-%d_%H-%M-%S", default set to iso8601

    :console_style => string
        'full' -> display full log message on console
        'message' -> display log level + log message on console
        default set to 'full'


## Copyright

The MIT License (MIT)

Copyright (c) 2013 [vkhatri (Virender Khatri)](http://github.com/vkhatri)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

