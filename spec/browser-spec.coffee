shell = require 'shell'
browser = require '../lib/browser'

describe "Browser", ->
  beforeEach ->
    spyOn(shell, "openExternal")

  it "opens the browser with the correct url", ->
    browser.open("test")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=test")

  it "escapes pound signs", ->
    browser.open("#")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%23")

  it "escapes question marks", ->
    browser.open("?")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%22")

  it "escapes percent signs", ->
    browser.open("%")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%25")

  it "escapes forward slashes", ->
    browser.open("/")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%2f")

  it "escapes dollar signs", ->
    browser.open("$")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%24")
