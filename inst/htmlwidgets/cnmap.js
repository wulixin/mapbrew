HTMLWidgets.widget({

  name: 'cnmap',

  type: 'output',

  factory: function(el, width, height) {
    var id = el.id;
    return {

      renderValue: function(x) {
        listData = [];
        for (var i = 0; i < x.id.length; i++) {
            listData.push({id: x.id[i], value: x.value[i], description: x.description[i]});
        }
        var map = AmCharts.makeChart(id, {
          type: "map",
          colorSteps: x.colorSteps,
          theme: x.theme,
          smallMap: {
            enabled: 1==x.smallMap,
            top: x.smallMapTop,
            right: x.smallMapRight
          },
          dataProvider: {
            map: "chinaHigh",
            areas: listData
          },
            export: {
                      enabled: 1==x.export
                  },
            valueLegend: {
              right: x.valueLegendRight,
              bottom: x.valueLegendBottom,
              minValue: x.minValue,
              maxValue: x.maxValue
          }
        });
        map.addTitle(x.title, x.titleSize, x.titleColor); // 标题
        map.addTitle(x.subtitle, x.subtitleSize, x.subtitleColor); //
        map.areasSettings = {
          autoZoom: 1==x.autoZoom,
          outlineAlpha: x.outlineAlpha, // 边界透明度
          outlineColor: x.outlineColor, // 边界的颜色
          outlineThickness: x.outlineThickness, // 边界宽度
          rollOverColor: x.rollOverColor // 鼠标掠过的颜色
        };

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
