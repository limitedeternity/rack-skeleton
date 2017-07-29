system('git add .')
puts("enter your git commit comment: ")
comment = gets.chomp
system('git commit -am #{comment}')
system('heroku maintenance:on')
system('git push heroku master')
system('heroku maintenance:off')
