$(document).ready ->
  jobWordsCount = 0

  $(document).on 'keyup', '#job_description', (e)->
    wordsCount = $(this).val().split(' ').length;
    
    if wordsCount != jobWordsCount
      jobWordsCount = wordsCount

      joblintObject = joblint($('#job_description').val())
      countsPopulator(joblintObject)
      issuesDescPopulator(joblintObject)

countsPopulator = (joblintObj) ->
  basicCounts = ["sexism", "culture", "realism", "recruiter", "tech"]

  for key in basicCounts
    job_lint_count = joblintObj.counts[key] || 0
    $("##{key}-issues-num").text(job_lint_count)

issuesDescPopulator = (joblintObj) ->
  issues = joblintObj.issues
  $(".joblint-issue-desc-container").html('') # Reset joblint descriptions

  for issue in issues
    $(".joblint-issue-desc-container").append(singleIssueDesc(issue))
    occuranceReplacer(issue)

singleIssueDesc = (issue) ->
    pannelType = {error: "panel-danger", warning: "panel-warning", notice: "panel-info"}

    "<div class='panel #{pannelType[issue.level]} joblint-issue' id='joblint-issue-position-#{issue.position}'>
      <div class='panel-heading'>
        <h3 class='panel-title'>#{issue.name.toUpperCase()} (#{issue.level})</h3>
      </div>
      <div class='panel-body'>
        <blockquote class='joblint-occurance'>#{issue.context}</blockquote>
        <p><strong>#{issue.solution}</strong> <em>#{issue.reason}</em></p>
      </div>
    </div>"

occuranceReplacer = (issue) ->
  $("#joblint-issue-position-" + issue.position + " .joblint-occurance").each ->
    original_html = $(this).html()
    occurance = "<strong class='joblint-word-occurance'>#{issue.occurance}</strong>"
    
    $(this).html original_html.replace("{{occurance}}", occurance)
