$(document).ready ->
  if $(".joblint-issue-tally-container")[0]
    job_desc = $(".attribute-data--markdown-field").text()
    joblintObj = jobLinter(job_desc)
    countsPopulator(joblintObj)
    issueDescPopulator(joblintObj)

  return

jobLinter = (job_desc) ->
  joblintObj = joblint(job_desc)
  return joblintObj

countsKeysArrayMaker = (joblintObj) ->
  countsKeys = new Array
  for key of joblintObj.counts
    countsKeys.push(key)
  return countsKeys

countsPopulator = (joblintObj) ->
  countsKeys = countsKeysArrayMaker(joblintObj)
  for countKey of countsKeys
    num = joblintObj.counts[countsKeys[countKey]]
    $("#" + countsKeys[countKey] + "-issues-num").replaceWith("(" + num + ")")
    $("#" + countsKeys[countKey] + "-bar").width(num * 15)
  return

issueDescPopulator = (joblintObj) ->
  issuesArray = joblintObj.issues
  for issue of issuesArray
    $(".joblint-issue-desc-container").append( \
      "<div id=\"joblint-issue-desc-" + issue + "\"" + \
      " class=\"joblint-issue-desc\">" + \
      "<h3>" + issuesArray[issue].name.toUpperCase() + " (" + \
      "<span class=\"joblint-level\">" + issuesArray[issue].level + \
      ")</h3> <p class=\"joblint-context\">" + \
      issuesArray[issue].context + "</p>" + \
      "<p class=\"joblint-explanation\">" + \
      "<span class=\"joblint-solution\">" + issuesArray[issue].solution + \
      "</span> <span class=\"joblint-reason\">" + \
      issuesArray[issue].reason + "</span> </div>")
      occuranceReplacer(joblintObj, issue)
  return

occuranceReplacer = (joblintObj, issueIndex) ->
  $("#joblint-issue-desc-" + issueIndex + " .joblint-context").each ->
    occurance = joblintObj.issues[issueIndex].occurance
    original_html = $(this).html()
    new_html = original_html.replace("{{occurance}}", \
      "<span class=\"joblint-occurance\">" + occurance + "</span>")
    $(this).html new_html
    return
  return
