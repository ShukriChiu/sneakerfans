#! /usr/bin/ruby
require_relative 'revlog_all.rb'

cmd       = ARGV[0]
argv_size = ARGV.size
args      = ARGV[1..argv_size]

def instructions
  puts "
 ▄▄       ▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄                  ▄▄▄▄▄▄▄▄▄        ▄▄▄▄
▐░░▌     ▐░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌                ▐░░░░░░░░░▌     ▄█░░░░▌
▐░▌░▌   ▐░▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌ ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░▌               ▐░█░█▀▀▀▀▀█░▌   ▐░░▌▐░░▌
▐░▌▐░▌ ▐░▌▐░▌▐░▌          ▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌       ▐░▌     ▐░▌     ▐░▌       ▐░▌▐░▌               ▐░▌▐░▌    ▐░▌    ▀▀ ▐░░▌
▐░▌ ▐░▐░▌ ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░▌          ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄█░▌     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌▐░▌               ▐░▌ ▐░▌   ▐░▌       ▐░░▌
▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌          ▐░▌       ▐░▌▐░░░░░░░░░░░▌     ▐░▌     ▐░░░░░░░░░░░▌▐░▌               ▐░▌  ▐░▌  ▐░▌       ▐░░▌
▐░▌   ▀   ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀█░█▀▀ ▐░▌          ▐░▌       ▐░▌▐░█▀▀▀▀█░█▀▀      ▐░▌     ▐░█▀▀▀▀▀▀▀█░▌▐░▌               ▐░▌   ▐░▌ ▐░▌       ▐░░▌
▐░▌       ▐░▌▐░▌          ▐░▌     ▐░▌  ▐░▌          ▐░▌       ▐░▌▐░▌     ▐░▌       ▐░▌     ▐░▌       ▐░▌▐░▌               ▐░▌    ▐░▌▐░▌       ▐░░▌
▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌      ▐░▌ ▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░▌      ▐░▌  ▄▄▄▄█░█▄▄▄▄ ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄      ▐░█▄▄▄▄▄█░█░▌▄  ▄▄▄▄█░░█▄▄▄
▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌      ▐░░░░░░░░░▌▐░▌▐░░░░░░░░░░░▌
 ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀        ▀▀▀▀▀▀▀▀▀  ▀  ▀▀▀▀▀▀▀▀▀▀▀
"
  puts "

Open-source Distributed Control System

Authors:
  *  Jianbo Yuan
  *  Lele Chen
  *  Shuwen Zhang
  *  Shujian Zhao

list of commands:

create (*path)      create the base of Mercurial
checkout (version)     pull the specified changeset
add ([files])          add the specified files on the next commit
delete ([files])       delete the specified files on the next commit
commit        commit the specified files or all outstanding changes
stat          print the diff files in repo from the base of creating
history       pritn the operation history
index (path)
merge (path)        merge two repo
help  -h      show the shell commands instructions
version       output version and copyright information
"
end

if (cmd)
  if cmd == "create"
    dir = args[0].nil? ? '.' : args[0]
    Dir.mkdir(dir) if !(File.exist?(dir))
    @repo = Repo.new(dir, 1)
    puts ".hg directory created successfully"
  else
    @repo = Repo.new()
    if cmd == "checkout"
      rev = @repo.changelog.tip()
      if args.size
        rev = args[0].to_i
        @repo.checkout(rev)
      end
      puts "checkout successfully"
    
    elsif cmd == "add"
      # cannot add files don't exist
      a = 0
      for i in args
        if !(File.directory?(i))
          if !(File.exist?(i))
            a = 1
            puts "#{i} doesn't exist"
          end
        end
      end
      if (a == 0)
        @repo.add(args)
        puts "add fiels successfully"
      end
    
    elsif cmd == "delete"
      # TODO: delete file from repo
      a = 0
      for i in args
        if !(File.exist?(i))
          a = 1
          puts "#{i} doesn't exist"
        end
      end
      if (a == 0)
        @repo.delete(args)
        puts "delete fiels successfully"
      end
    
    elsif cmd == "commit"
      # cannot empty commit
      if !(File.exist?(".hg/to-add") || File.exist?(".hg/to-delete"))
        puts "nothing to commit"
      else
        @repo.commit()
        puts "commit successfully"
      end
    
    elsif cmd == "stat"
      @repo.diffdir(@repo.root)
    
    elsif cmd == "history"
      (0..@repo.changelog.tip()).each do |i|
        changes = @repo.changelog.changeset(i)
        p1, p2  = @repo.changelog.parents(i)
        puts "#{i} : #{p1} #{p2} #{@repo.changelog.node(i)}"
        puts "manifest nodeid: #{changes[0]}"
        puts "user: #{changes[1]}"
        puts "time: #{changes[2]}"
        puts "changed files: " + "#{changes[3]}"
        puts "description: #{changes[4]}"
        puts
      end
    
    elsif cmd == "allfiles"
      puts "This repo contains: "
      File.open(".hg/dircache", "r") do |file|
        file.each_line do |line|
          p line.chomp.split(" ").last
        end
      end
    
    elsif cmd == "index"
      f = args[0]
      r = Filelog.new(@repo, f)
      (0..5).each do |i|
        p1, p2 = r.parents(i)
        puts "#{i} : #{p1}  #{p2}  #{r.node(i)}"
        puts "offset: #{r.start(i)} len: #{r.length(i)} base: #{r.base(i)}"
      end
    
    elsif cmd == "merge"
      other = Repo.new(args[0])
      @repo.merge(other)
      puts "merge successfully"
    
    else
      if cmd == "version" || cmd == "-v"
        puts "0.1"
        exit
      end
      if cmd == "help" || cmd == "-h"
        instructions
        exit
      end
      puts "Wrong Prameters, Please use help or -h to checkout instructions"
    end
  end

else
  puts "Need Prameters, Please use help or -h to checkout instructions "
end