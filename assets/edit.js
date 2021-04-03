(() => {
  let editLink = document.getElementById("git-repository-button").parentElement
  const relativeFile = location
    .pathname
    .split("/")
    .slice(-path_to_root.split("/").length)
    .join("/")
    .replace(/\.html$/, ".md")
  editLink.href = editLink.href + "/edit/master/src/" + relativeFile
})();
