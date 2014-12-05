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

  it "escapes pound signs", ->
    browser.open("#")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%23")

  it "escapes question marks", ->
    browser.open("?")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%3F")

  it "escapes percent signs", ->
    browser.open("%")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%25")

  it "escapes forward slashes", ->
    browser.open("/")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%2F")

  it "escapes dollar signs", ->
    browser.open("$")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%24")

  it "escapes ampersands", ->
    browser.open("&")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%26")

  it "escapes +", ->
    browser.open("+")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%2B")

  it "escapes ,", ->
    browser.open(",")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%2C")

  it "escapes :", ->
    browser.open(":")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%3A")

  it "escapes ;", ->
    browser.open(";")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%3B")

  it "escapes =", ->
    browser.open("=")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%3D")

  it "escapes @", ->
    browser.open("@")
    expect(shell.openExternal).toHaveBeenCalledWith("http://localhost:8888/?spec=%40")
