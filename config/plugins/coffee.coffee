module.exports = (lineman) ->
  files:
    coffee:
      app: "app/js/**/*.coffee"
      spec: "spec/**/*.coffee"
      specHelpers: "spec/helpers/**/*.coffee"
      generated: "generated/js/app.coffee.js"
      generatedSpec: "generated/js/spec.coffee.js"
      generatedSpecHelpers: "generated/js/spec-helpers.coffee.js"

  config:
    loadNpmTasks: lineman.config.application.loadNpmTasks.concat('grunt-contrib-coffee')

    prependTasks:
      common: lineman.config.application.prependTasks.common.concat(["coffee"])

    coffee:
      compile:
        files:
          "<%= files.coffee.generated %>": "<%= files.coffee.app %>"
          "<%= files.coffee.generatedSpec %>": "<%= files.coffee.spec %>"
          "<%= files.coffee.generatedSpecHelpers %>": "<%= files.coffee.specHelpers %>"

    watch:
      coffee:
        files: "<%= files.coffee.app %>"
        tasks: ["coffee", "concat_sourcemap:js"]

