# Simple deploy

# Version 1: simply build and deploy to gh-pages
function deploy()
  # Only push if on a build that is not a PR
  pr = get(ENV, "TRAVIS_PULL_REQUEST", nothing)
  if pr === nothing
    @info "Local build. Not pushing"
    return
  elseif pr != "false"
    @info "PR. Not pushing"
    return
  end

  # Check that book/build exists
  println(">> readdir")
  println(readdir())
  isdir("book/build") || error("Couldn't find build")

  key = get(ENV, "GITHUB_AUTH", nothing)
  if key === nothing
    error("GITHUB_AUTH is required, create and add to Travis settings")
  end

  repo = ENV["TRAVIS_REPO_SLUG"]
  user = split(repo, "/")[1]
  upstream = "https://$user:$key@github.com/$repo"
  run(`git remote add upstream $upstream`)
  run(`git fetch --all`)
  # Try to branch to gh-pages, creating it if it doesn't exist
  if !success(`git checkout -f -b gh-pages upstream/gh-pages`)
    run(`git checkout --orphan gh-pages`)
    run(`git reset --hard`)
    run(`git commit --allow-empty -m "Initial commit"`)
  end

  # This will create a folder for different branches, so more than one book is online
  dst = ENV["TRAVIS_BRANCH"]
  if dst == "master"
    dst = "."
  else
    # Remove and recreate the folder
    isdir(dst) && rm(dst, recursive=true)
    mkpath(dst)
  end

  # Copy the build html and images folder to dst
  mv("book/build/book.html", "$dst/index.html", force=true)
  mv("book/build/images", "$dst/images", force=true)
  pkg = split(repo, "/")[2]
  if isfile("book/build/book.pdf")
      mv("book/build/book.pdf", "$dst/introAjulia.pdf", force=true)
      pdffile = "https://$user.github.io/$pkg/" *
          (dst == "." ? "" : "$dst/") * "introAjulia.pdf"
      @info "Here is your pdf file:"
      @info "  \033[1;33m$pdffile\033[0m"
  end
  rm("book/build", recursive=true)
  run(`git add $dst`)
  if !success(`git diff --cached --exit-code`) # Don't commit if there are no changes
    run(`git commit -m ":robot: Building book in branch $dst"`)
    run(`git push upstream gh-pages`)
  end

  site = "https://$user.github.io/$pkg/" * (dst == "." ? "" : "$dst/") * "index.html"
  @info "Here is your site:"
  @info "  \033[1;33m$site\033[0m"
end

deploy()
