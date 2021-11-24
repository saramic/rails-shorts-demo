## SCRIPT

mm: Welcome

-- intro --

sj: Hi Michael, I'm doing a coding boot camp and I need something to make my
    project standout
mm: Testing

sj: really? is that what the industry is looking for
mm: Yeah

sj: can I show you what I've got so far?
mm: Shoot

-- intro the app --

== mm navigate to page
sj: well I have built a link shortner
mm: nice

sj: so you have no urls in the system - a blank page
mm: blank

== mm add a long url to google
sj: you can now choose to add a url, a long one
mm: submit

== mm highlight short url
sj: right and now you have a short url
mm: 1

sj: yeah for the moment I am using the id in the db, this is a naive
    implmentation, what did you want me to do? use a Linear Congruential
    Generator on a first commit?

== mm click
sj: if you click on it, it takes you to the long url

== mm add a short url `http://localhost:3000/?and-a-really-long-query-parameter`
sj: for testing you can use a long url on localhost with some query parameters
    not to have to leave the site
mm: done

== mm cURL type `curl http://localhost:3000/1`
sj: if you cURL it it also works
mm: nice

sj: you can also see the stats for a given url
mm: you did this?

sj: with a "rails new" and some "generate scaffold" statements
mm: wow

-- adding tests --

sj: so how do you add tests?
mm: easy we add gems and describe the app just like you did
== mm add gems, text and binding.pry then skip to finished example
== mm commit

-- making them readable --

sj: so it seems tested but that is a blob of rubish code you wrote, how can
    anyone understand what is written there?
mm: they can't, that's how i make "fat stacks"
sj: isn't the the crux of testing "arrange", "act", "assert"
mm: this ain't DotNet we use "Given", "When", "Then" in ruby
sj: do it
== mm add gem and split into steps, commit

-- run it in a browser --

sj: that binding.pry is kind of cute but it's 2021, can't I see my tests run in
    a browser?
mm: yes
== mm add capybara setup and run in browser, test takes longer to run and fails
    on more info
== mm fix and commit

-- abstract page object model --

sj: some of these test commands seem pretty "tightly coupled" to the
    implmentation in the HTML
sj: I was reading some Martin Fowler about Page Objects, is that something you
    would use?
== mm navigates to https://martinfowler.com/bliki/PageObject.html
mm: yes

== mm add site_prism and fixes examples
== mm commit

-- fearless refactor --

sj: so the app works the same, what's the point of tests?
mm: fearless refactoring
== mm remove whole stats controller and half of url controller - tests still
   pass
== mm commit

-- incremental delivery --

sj: hey Michael? you heard about TDD? I hear you were meant to write the tests
    first?
mm: really?

>> is there time for a pending spec <<

