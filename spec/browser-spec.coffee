shell = require 'shell'
browser = require '../lib/browser'

describe "Browser", ->
  beforeEach ->
    spyOn(shell, "openExternal")

  it "opens the browser with the correct url", ->
    browser.open("test")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=test")

  it "opens the browser with the correct url for a long test name", ->
    browser.open("An example CoffeeScript test suite First group #adds them")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=An%20example%20CoffeeScript%20test%20suite%20First%20group%20%23adds%20them")

  it "escapes url reserved characters", ->
    browser.open("$&+,/:;=?@")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%24%26%2B%2C%2F%3A%3B%3D%3F%40")

  it "escapes url unsafe characters", ->
    browser.open(' <>"#%{}|\^[]`')
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%20%3C%3E%22%23%25%7B%7D%7C%5E%5B%5D%60")
