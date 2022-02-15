class PadSummaryModel {
  final int? id;
  final int? siteId;
  final int? padId;
  final String? site_Name;
  final String? pad_Name;
  final String? date;
  final dynamic padComments;
  final String? group_Line_Average_Pressure;
  final String? group_Line_Average_Temperature;
  final String? utility_Steam_Average_Pressure;
  final String? utility_Steam_Volume;
  final String? chemical_Injection_Volume;
  final String? gasCompressor;
  final String? p030_Run_Hours;
  final String? p035_Run_Hours;
  final String? p040_Run_Hours;
  final String? k001_Run_Hours;
  final String? k002_Run_Hours;
  final double? theoretical_Oil_Volume;
  final double? theoretical_Water_Volume;
  final double? actual_Oil_Volume;
  final double? actual_Water_Volume;
  final double? actual_WOR;
  final double? chemical_Injection_Ratio;
  final double? theoretical_Oil_Volume_Rounded;
  final double? theoretical_Water_Volume_Rounded;
  final double? actual_Oil_Volume_Rounded;
  final double? actual_Water_Volume_Rounded;
  final double? actual_WOR_Rounded;
  final String? group_Line_Average_Pressure_Rounded;
  final String? group_Line_Average_Temperature_Rounded;
  final String? utility_Steam_Average_Pressure_Rounded;
  final String? utility_Steam_Volume_Rounded;
  final String? chemical_Injection_Volume_Rounded;
  final String? gasCompressor_Rounded;
  final String? p030_Run_Hours_Rounded;
  final String? p035_Run_Hours_Rounded;
  final String? p040_Run_Hours_Rounded;
  final String? k001_Run_Hours_Rounded;
  final String? k002_Run_Hours_Rounded;

  PadSummaryModel.fromJson(Map json)
      : id = json['id'],
        siteId = json['siteId'],
        padId = json['padId'],
        site_Name = json['site_Name'],
        pad_Name = json['pad_Name'],
        date = json['date'],
        padComments = json['padComments'],
        group_Line_Average_Pressure = json['group_Line_Average_Pressure'],
        group_Line_Average_Temperature = json['group_Line_Average_Temperature'],
        utility_Steam_Average_Pressure = json['utility_Steam_Average_Pressure'],
        utility_Steam_Volume = json['utility_Steam_Volume'],
        chemical_Injection_Volume = json['chemical_Injection_Volume'],
        gasCompressor = json['gasCompressor'],
        p030_Run_Hours = json['p030_Run_Hours'],
        p035_Run_Hours = json['p035_Run_Hours'],
        p040_Run_Hours = json['p040_Run_Hours'],
        k001_Run_Hours = json['k001_Run_Hours'],
        k002_Run_Hours = json['k002_Run_Hours'],
        theoretical_Oil_Volume = json['theoretical_Oil_Volume'],
        theoretical_Water_Volume = json['theoretical_Water_Volume'],
        actual_Oil_Volume = json['actual_Oil_Volume'],
        actual_Water_Volume = json['actual_Water_Volume'],
        actual_WOR = json['actual_WOR'],
        chemical_Injection_Ratio = json['chemical_Injection_Ratio'],
        theoretical_Oil_Volume_Rounded = json['theoretical_Oil_Volume_Rounded'],
        theoretical_Water_Volume_Rounded =
            json['theoretical_Water_Volume_Rounded'],
        actual_Oil_Volume_Rounded = json['actual_Oil_Volume_Rounded'],
        actual_Water_Volume_Rounded = json['actual_Water_Volume_Rounded'],
        actual_WOR_Rounded = json['actual_WOR_Rounded'],
        group_Line_Average_Pressure_Rounded =
            json['group_Line_Average_Pressure_Rounded'],
        group_Line_Average_Temperature_Rounded =
            json['group_Line_Average_Temperature_Rounded'],
        utility_Steam_Average_Pressure_Rounded =
            json['utility_Steam_Average_Pressure_Rounded'],
        utility_Steam_Volume_Rounded = json['utility_Steam_Volume_Rounded'],
        chemical_Injection_Volume_Rounded =
            json['chemical_Injection_Volume_Rounded'],
        gasCompressor_Rounded = json['gasCompressor_Rounded'],
        p030_Run_Hours_Rounded = json['p030_Run_Hours_Rounded'],
        p035_Run_Hours_Rounded = json['p035_Run_Hours_Rounded'],
        p040_Run_Hours_Rounded = json['p040_Run_Hours_Rounded'],
        k001_Run_Hours_Rounded = json['k001_Run_Hours_Rounded'],
        k002_Run_Hours_Rounded = json['k002_Run_Hours_Rounded'];
}
