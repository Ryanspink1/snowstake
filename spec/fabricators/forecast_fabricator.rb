Fabricator(:forecast) do
   current_temp                   { rand(50).to_s }
   current_wind_dir               { %w(N S E W NE NW SE SW ).sample }
   current_wind_speed             { rand(30).to_s }
   period_one_dow                 { %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).sample }
   period_one_date                { %w(2017/11/13 2017/11/14 2017/11/15 2017/11/16 2017/11/17 2017/11/18).sample }
   period_one_day_snow            { rand(24).to_s }
   period_one_day_weather         { %w(Sunny Windy Cloudy Rainy Snow Breezy).sample }
   period_one_day_wind_speed      { rand(30).to_s }
   period_one_day_wind_dir        { %w(N S E W NE NW SE SW ).sample }
   period_one_day_temp            { rand(50).to_s }
   period_one_night_snow          { rand(24).to_s }
   period_one_night_weather       { %w(Sunny Windy Cloudy Rainy Snow Breezy).sample }
   period_one_night_wind_speed    {rand(30).to_s }
   period_one_night_wind_dir      { %w(N S E W NE NW SE SW ).sample }
   period_one_night_temp          { rand(50).to_s }
   period_two_dow                 { %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).sample }
   period_two_date                { %w(2017/11/13 2017/11/14 2017/11/15 2017/11/16 2017/11/17 2017/11/18).sample }
   period_two_day_snow            { rand(24).to_s }
   period_two_day_weather         { %w(Sunny Windy Cloudy Rainy Snow Breezy).sample }
   period_two_day_wind_speed      { rand(30).to_s }
   period_two_day_wind_dir        { %w(N S E W NE NW SE SW ).sample }
   period_two_day_temp            { rand(50).to_s }
   period_two_night_snow          { rand(24).to_s }
   period_two_night_weather       { %w(Sunny Windy Cloudy Rainy Snow Breezy).sample }
   period_two_night_wind_speed    {rand(30).to_s }
   period_two_night_wind_dir      { %w(N S E W NE NW SE SW ).sample }
   period_two_night_temp          { rand(50).to_s }
   period_three_dow               { %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).sample }
   period_three_date              { %w(2017/11/13 2017/11/14 2017/11/15 2017/11/16 2017/11/17 2017/11/18).sample }
   period_three_day_snow          { rand(24).to_s }
   period_three_day_weather       { %w(Sunny Windy Cloudy Rainy Snow Breezy).sample }
   period_three_day_wind_speed    { rand(30).to_s }
   period_three_day_wind_dir      { %w(N S E W NE NW SE SW ).sample }
   period_three_day_temp          { rand(50).to_s }
   period_three_night_snow        { rand(24).to_s }
   period_three_night_weather     { %w(Sunny Windy Cloudy Rainy Snow Breezy).sample }
   period_three_night_wind_speed  {rand(30).to_s }
   period_three_night_wind_dir    { %w(N S E W NE NW SE SW ).sample }
   period_three_night_temp        { rand(50).to_s }
   period_four_dow                { %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).sample }
   period_four_date               { %w(2017/11/13 2017/11/14 2017/11/15 2017/11/16 2017/11/17 2017/11/18).sample }
   period_four_day_snow           { rand(24).to_s }
   period_four_day_weather        { %w(Sunny Windy Cloudy Rainy Snow Breezy).sample }
   period_four_day_wind_speed     { rand(30).to_s }
   period_four_day_wind_dir       { %w(N S E W NE NW SE SW ).sample }
   period_four_day_temp           { rand(50).to_s }
   period_four_night_snow         { rand(24).to_s }
   period_four_night_weather      { %w(Sunny Windy Cloudy Rainy Snow Breezy).sample }
   period_four_night_wind_speed   {rand(30).to_s }
   period_four_night_wind_dir     { %w(N S E W NE NW SE SW ).sample }
   period_four_night_temp         { rand(50).to_s }
   period_five_dow                { %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).sample }
   period_five_date               { %w(2017/11/13 2017/11/14 2017/11/15 2017/11/16 2017/11/17 2017/11/18).sample }
   period_five_day_snow           { rand(24).to_s }
   period_five_day_weather        { %w(Sunny Windy Cloudy Rainy Snow Breezy).sample }
   period_five_day_wind_speed     { rand(30).to_s }
   period_five_day_wind_dir       { %w(N S E W NE NW SE SW ).sample }
   period_five_day_temp           { rand(50).to_s }
   period_five_night_snow         { rand(24).to_s }
   period_five_night_weather      { %w(Sunny Windy Cloudy Rainy Snow Breezy).sample }
   period_five_night_wind_speed   {rand(30).to_s }
   period_five_night_wind_dir     { %w(N S E W NE NW SE SW ).sample }
   period_five_night_temp         { rand(50).to_s }
end
