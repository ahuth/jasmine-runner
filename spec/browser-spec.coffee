shell = require 'shell'
Browser = require '../lib/browser'

describe "Browser", ->
  browser = null

  beforeEach ->
    browser = new Browser
    spyOn(shell, "openExternal")

  it "opens the browser with the correct url", ->
    browser.open("a short url")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=a short url")

    browser.open("An example CoffeeScript test suite First group adds them")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=An example CoffeeScript test suite First group adds them")
