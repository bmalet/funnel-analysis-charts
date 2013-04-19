Funnel =
  simple : (options) ->
    options.el.highcharts
      chart:
        type: "column"
        marginBottom: 40
      title:
        text: null
      xAxis:
        categories: options.categories
      legend:
        enabled: false
      yAxis:
        min: 0
        max: 100
        title:
          text: "Conversion (%)"
      tooltip:
        formatter : ->
          """
            #{this.y}% conversion on <b>#{this.x}</b>
          """
      series: [
        data: options.data
      ]
  cohort : (options) ->
    options.el.highcharts
      chart:
        type: "line"
        marginBottom: 60

      title:
        text: null#"A weekly cohort analysis of conversion funnel"

      xAxis:
        categories: options.categories

      yAxis:
        title:
          text: "Conversion (%)"
        min: 0
        max: 100

      tooltip:
        valueSuffix: "%"

      tooltip:
        formatter : ->
          """
            <b>#{this.series.name}</b><br />
            #{this.y}% conversion on <b>#{this.x}</b>
          """

      legend:
        align: "center"
        verticalAlign: "bottom"
        x: 0
        y: -5
        borderWidth: 0

      series: options.cohorts



$ ->
  Funnel.simple(
    el         : $("#funnel1-simple")
    categories : ["Visit", "Register", "Purchase", "Refer"]
    data       : [100, 53, 30, 11]
  )
  
  Funnel.cohort(
    el         : $("#funnel1-cohort")
    categories : ["Visit", "Register", "Purchase", "Refer"]
    cohorts    : [
        name: "Week 1"
        data: [100, 40, 20, 5]
      ,
        name: "Week 2"
        data: [100, 50, 30, 10]
      ,
        name: "Week 3"
        data: [100, 70, 40, 20]
    ]
  )


  Funnel.simple(
    el         : $("#funnel2-simple")
    categories : ["Visit", "Product Select", "Register", "Purchase"]
    data       : [100, 47, 22, 8]
  )
  
  Funnel.cohort(
    el         : $("#funnel2-cohort")
    categories : ["Visit", "Product Select", "Register", "Purchase"]
    cohorts    : [
        name: "SEM"
        data: [100, 60, 32, 13]
      ,
        name: "Twitter"
        data: [100, 50, 30, 9]
      ,
        name: "Facebook"
        data: [100, 30, 5, 2]
    ]
  )
  
