Walrus = if require? and exports? then require './walrus' else window.Walrus

###
TODO
- Finish :strftime
- Write :relativetime (better name?)
- Write :ordinal
###

###

%a - The abbreviated weekday name (``Sun'')
%A - The  full  weekday  name (``Sunday'')
%b - The abbreviated month name (``Jan'')
%B - The  full  month  name (``January'')
%c - The preferred local date and time representation
%d - Day of the month (01..31)
%H - Hour of the day, 24-hour clock (00..23)
%I - Hour of the day, 12-hour clock (01..12)
%j - Day of the year (001..366)
%m - Month of the year (01..12)
%M - Minute of the hour (00..59)
%p - Meridian indicator (``AM''  or  ``PM'')
%S - Second of the minute (00..60)
%U - Week  number  of the current year,
        starting with the first Sunday as the first
        day of the first week (00..53)
%W - Week  number  of the current year,
        starting with the first Monday as the first
        day of the first week (00..53)
%w - Day of the week (Sunday is 0, 0..6)
%x - Preferred representation for the date alone, no time
%X - Preferred representation for the time alone, no date
%y - Year without a century (00..99)
%Y - Year with century
%Z - Time zone name
%% - Literal ``%'' character

###

FULL_DAYNAMES = [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' ]
ABBR_DAYNAMES = [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ]

FULL_MONTHNAMES = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
ABBR_MONTHNAMES = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ]

Walrus.addFilter 'strftime', ( dateish, format ) ->

  date = new Date dateish

  format.replace /%(a|A|b|B|c|d|H|I|m|M|p|S|w|y|Y)/g, ( input ) ->

    switch input
      when '%a' then ABBR_DAYNAMES[ date.getDay( ) ]
      when '%A' then FULL_DAYNAMES[ date.getDay( ) ]
      when '%b' then ABBR_MONTHNAMES[ date.getMonth( ) ]
      when '%B' then FULL_MONTHNAMES[ date.getMonth( ) ]
      when '%c' then date.toLocaleString( )
      when '%d' then date.getDate( )
      when '%H' then date.getHours( )
      when '%I' then date.getHours( ) % 12
      # TODO %j
      when '%m' then date.getMonth( ) + 1
      when '%M' then date.getMinutes( )
      when '%p' then "#{if date.getHours( ) < 12 then 'A' else 'P'}M"
      when '%S' then date.getSeconds( )
      # TODO %U
      # TODO %W
      when '%w' then date.getDay( )
      # TODO %x
      # TODO %X
      when '%y' then date.getFullYear( ).toString( ).slice -2 # TODO this kinda sucks, do math much?
      when '%Y' then date.getFullYear( )
      # TODO %Z
      # TODO %%
