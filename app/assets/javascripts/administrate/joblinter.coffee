$(document).ready ->
  if $(".joblint")[0]
    job_desc = $(".attribute-data--markdown-field").text()
    joblintObj = jobLinter(job_desc)
    countsPopulator(joblintObj)

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
    $("#" + countsKeys[countKey] + "-issues-num").append("(" + num + ")")
    $("#" + countsKeys[countKey] + "-bar").width(num * 15)
  return
