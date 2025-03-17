//
//  Codable.swift
//  WeatherAPP-WA
//
//  Created by Oleksandr Hryhoruk on 2025-03-14.
//
import Foundation

let jsonString = """

        {
          "cod": "200",
          "message": 0,
          "cnt": 40,
          "list": [
            {
              "dt": 1741932000,
              "main": {
                "temp": 4.07,
                "feels_like": 1.19,
                "temp_min": 4.07,
                "temp_max": 4.07,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 971,
                "humidity": 79,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 804,
                  "main": "Clouds",
                  "description": "overcast clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 96
              },
              "wind": {
                "speed": 3.27,
                "deg": 297,
                "gust": 5.2
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-14 06:00:00"
            },
            {
              "dt": 1741942800,
              "main": {
                "temp": 4.66,
                "feels_like": 4.66,
                "temp_min": 4.66,
                "temp_max": 5.83,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 972,
                "humidity": 76,
                "temp_kf": -1.17
              },
              "weather": [
                {
                  "id": 804,
                  "main": "Clouds",
                  "description": "overcast clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 97
              },
              "wind": {
                "speed": 0.35,
                "deg": 45,
                "gust": 0.38
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-14 09:00:00"
            },
            {
              "dt": 1741953600,
              "main": {
                "temp": 8.78,
                "feels_like": 7.09,
                "temp_min": 8.78,
                "temp_max": 11.14,
                "pressure": 1008,
                "sea_level": 1008,
                "grnd_level": 972,
                "humidity": 65,
                "temp_kf": -2.36
              },
              "weather": [
                {
                  "id": 804,
                  "main": "Clouds",
                  "description": "overcast clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 91
              },
              "wind": {
                "speed": 2.93,
                "deg": 161,
                "gust": 4.33
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-14 12:00:00"
            },
            {
              "dt": 1741964400,
              "main": {
                "temp": 11.32,
                "feels_like": 10.36,
                "temp_min": 11.32,
                "temp_max": 11.32,
                "pressure": 1007,
                "sea_level": 1007,
                "grnd_level": 971,
                "humidity": 71,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 500,
                  "main": "Rain",
                  "description": "light rain",
                  "icon": "10d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 2.91,
                "deg": 171,
                "gust": 6.77
              },
              "visibility": 10000,
              "pop": 0.28,
              "rain": {
                "3h": 0.19
              },
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-14 15:00:00"
            },
            {
              "dt": 1741975200,
              "main": {
                "temp": 9.54,
                "feels_like": 7.14,
                "temp_min": 9.54,
                "temp_max": 9.54,
                "pressure": 1006,
                "sea_level": 1006,
                "grnd_level": 970,
                "humidity": 89,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 500,
                  "main": "Rain",
                  "description": "light rain",
                  "icon": "10n"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 4.69,
                "deg": 151,
                "gust": 10.31
              },
              "visibility": 6074,
              "pop": 1,
              "rain": {
                "3h": 2.66
              },
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-14 18:00:00"
            },
            {
              "dt": 1741986000,
              "main": {
                "temp": 9.95,
                "feels_like": 7.16,
                "temp_min": 9.95,
                "temp_max": 9.95,
                "pressure": 1005,
                "sea_level": 1005,
                "grnd_level": 969,
                "humidity": 83,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 501,
                  "main": "Rain",
                  "description": "moderate rain",
                  "icon": "10n"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 6.06,
                "deg": 169,
                "gust": 12.16
              },
              "visibility": 10000,
              "pop": 1,
              "rain": {
                "3h": 3.29
              },
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-14 21:00:00"
            },
            {
              "dt": 1741996800,
              "main": {
                "temp": 10.2,
                "feels_like": 9.55,
                "temp_min": 10.2,
                "temp_max": 10.2,
                "pressure": 1005,
                "sea_level": 1005,
                "grnd_level": 969,
                "humidity": 87,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 500,
                  "main": "Rain",
                  "description": "light rain",
                  "icon": "10n"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 6.33,
                "deg": 267,
                "gust": 11.07
              },
              "visibility": 10000,
              "pop": 1,
              "rain": {
                "3h": 1.27
              },
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-15 00:00:00"
            },
            {
              "dt": 1742007600,
              "main": {
                "temp": 3.59,
                "feels_like": -0.45,
                "temp_min": 3.59,
                "temp_max": 3.59,
                "pressure": 1011,
                "sea_level": 1011,
                "grnd_level": 974,
                "humidity": 91,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 500,
                  "main": "Rain",
                  "description": "light rain",
                  "icon": "10n"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 5.04,
                "deg": 328,
                "gust": 7.2
              },
              "visibility": 10000,
              "pop": 0.38,
              "rain": {
                "3h": 0.25
              },
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-15 03:00:00"
            },
            {
              "dt": 1742018400,
              "main": {
                "temp": 2.61,
                "feels_like": -1.91,
                "temp_min": 2.61,
                "temp_max": 2.61,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 976,
                "humidity": 93,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 500,
                  "main": "Rain",
                  "description": "light rain",
                  "icon": "10d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 5.52,
                "deg": 4,
                "gust": 8.5
              },
              "visibility": 10000,
              "pop": 0.2,
              "rain": {
                "3h": 0.18
              },
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-15 06:00:00"
            },
            {
              "dt": 1742029200,
              "main": {
                "temp": 2.73,
                "feels_like": -1.78,
                "temp_min": 2.73,
                "temp_max": 2.73,
                "pressure": 1016,
                "sea_level": 1016,
                "grnd_level": 978,
                "humidity": 89,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 804,
                  "main": "Clouds",
                  "description": "overcast clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 5.55,
                "deg": 35,
                "gust": 7.83
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-15 09:00:00"
            },
            {
              "dt": 1742040000,
              "main": {
                "temp": 3.72,
                "feels_like": -0.68,
                "temp_min": 3.72,
                "temp_max": 3.72,
                "pressure": 1016,
                "sea_level": 1016,
                "grnd_level": 979,
                "humidity": 80,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 500,
                  "main": "Rain",
                  "description": "light rain",
                  "icon": "10d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 5.88,
                "deg": 45,
                "gust": 7.68
              },
              "visibility": 10000,
              "pop": 0.22,
              "rain": {
                "3h": 0.23
              },
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-15 12:00:00"
            },
            {
              "dt": 1742050800,
              "main": {
                "temp": 4.13,
                "feels_like": -0.03,
                "temp_min": 4.13,
                "temp_max": 4.13,
                "pressure": 1016,
                "sea_level": 1016,
                "grnd_level": 979,
                "humidity": 76,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 500,
                  "main": "Rain",
                  "description": "light rain",
                  "icon": "10d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 5.6,
                "deg": 62,
                "gust": 7.97
              },
              "visibility": 10000,
              "pop": 0.2,
              "rain": {
                "3h": 0.1
              },
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-15 15:00:00"
            },
            {
              "dt": 1742061600,
              "main": {
                "temp": 2.11,
                "feels_like": -2.67,
                "temp_min": 2.11,
                "temp_max": 2.11,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 978,
                "humidity": 96,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 600,
                  "main": "Snow",
                  "description": "light snow",
                  "icon": "13n"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 5.78,
                "deg": 73,
                "gust": 11.54
              },
              "visibility": 1192,
              "pop": 1,
              "snow": {
                "3h": 1.49
              },
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-15 18:00:00"
            },
            {
              "dt": 1742072400,
              "main": {
                "temp": 0.36,
                "feels_like": -4.07,
                "temp_min": 0.36,
                "temp_max": 0.36,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 977,
                "humidity": 100,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 601,
                  "main": "Snow",
                  "description": "snow",
                  "icon": "13n"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 4.35,
                "deg": 48,
                "gust": 9.43
              },
              "visibility": 104,
              "pop": 1,
              "snow": {
                "3h": 8.21
              },
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-15 21:00:00"
            },
            {
              "dt": 1742083200,
              "main": {
                "temp": 0.19,
                "feels_like": -4.61,
                "temp_min": 0.19,
                "temp_max": 0.19,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 977,
                "humidity": 99,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 601,
                  "main": "Snow",
                  "description": "snow",
                  "icon": "13n"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 4.88,
                "deg": 47,
                "gust": 9.39
              },
              "visibility": 28,
              "pop": 1,
              "snow": {
                "3h": 2.94
              },
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-16 00:00:00"
            },
            {
              "dt": 1742094000,
              "main": {
                "temp": 0.17,
                "feels_like": -3.82,
                "temp_min": 0.17,
                "temp_max": 0.17,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 976,
                "humidity": 99,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 600,
                  "main": "Snow",
                  "description": "light snow",
                  "icon": "13n"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 3.64,
                "deg": 39,
                "gust": 6.47
              },
              "visibility": 46,
              "pop": 0.38,
              "snow": {
                "3h": 0.28
              },
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-16 03:00:00"
            },
            {
              "dt": 1742104800,
              "main": {
                "temp": -0.01,
                "feels_like": -3.55,
                "temp_min": -0.01,
                "temp_max": -0.01,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 977,
                "humidity": 99,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 600,
                  "main": "Snow",
                  "description": "light snow",
                  "icon": "13d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 3.04,
                "deg": 21,
                "gust": 4.53
              },
              "pop": 0.2,
              "snow": {
                "3h": 0.11
              },
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-16 06:00:00"
            },
            {
              "dt": 1742115600,
              "main": {
                "temp": 0.98,
                "feels_like": -2.77,
                "temp_min": 0.98,
                "temp_max": 0.98,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 977,
                "humidity": 95,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 600,
                  "main": "Snow",
                  "description": "light snow",
                  "icon": "13d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 3.56,
                "deg": 355,
                "gust": 4.64
              },
              "visibility": 10000,
              "pop": 0.2,
              "snow": {
                "3h": 0.14
              },
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-16 09:00:00"
            },
            {
              "dt": 1742126400,
              "main": {
                "temp": 2.85,
                "feels_like": 0.17,
                "temp_min": 2.85,
                "temp_max": 2.85,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 977,
                "humidity": 84,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 804,
                  "main": "Clouds",
                  "description": "overcast clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 2.7,
                "deg": 340,
                "gust": 3.98
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-16 12:00:00"
            },
            {
              "dt": 1742137200,
              "main": {
                "temp": 4.19,
                "feels_like": 2.03,
                "temp_min": 4.19,
                "temp_max": 4.19,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 977,
                "humidity": 70,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 804,
                  "main": "Clouds",
                  "description": "overcast clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 91
              },
              "wind": {
                "speed": 2.4,
                "deg": 324,
                "gust": 3.61
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-16 15:00:00"
            },
            {
              "dt": 1742148000,
              "main": {
                "temp": 0.8,
                "feels_like": -1.51,
                "temp_min": 0.8,
                "temp_max": 0.8,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 977,
                "humidity": 71,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 803,
                  "main": "Clouds",
                  "description": "broken clouds",
                  "icon": "04n"
                }
              ],
              "clouds": {
                "all": 52
              },
              "wind": {
                "speed": 1.99,
                "deg": 313,
                "gust": 2.22
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-16 18:00:00"
            },
            {
              "dt": 1742158800,
              "main": {
                "temp": -0.43,
                "feels_like": -2.92,
                "temp_min": -0.43,
                "temp_max": -0.43,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 977,
                "humidity": 72,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 800,
                  "main": "Clear",
                  "description": "clear sky",
                  "icon": "01n"
                }
              ],
              "clouds": {
                "all": 0
              },
              "wind": {
                "speed": 1.97,
                "deg": 292,
                "gust": 1.97
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-16 21:00:00"
            },
            {
              "dt": 1742169600,
              "main": {
                "temp": -0.99,
                "feels_like": -4.55,
                "temp_min": -0.99,
                "temp_max": -0.99,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 977,
                "humidity": 78,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 800,
                  "main": "Clear",
                  "description": "clear sky",
                  "icon": "01n"
                }
              ],
              "clouds": {
                "all": 0
              },
              "wind": {
                "speed": 2.85,
                "deg": 271,
                "gust": 5.21
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-17 00:00:00"
            },
            {
              "dt": 1742180400,
              "main": {
                "temp": -1.49,
                "feels_like": -5.45,
                "temp_min": -1.49,
                "temp_max": -1.49,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 976,
                "humidity": 82,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 800,
                  "main": "Clear",
                  "description": "clear sky",
                  "icon": "01n"
                }
              ],
              "clouds": {
                "all": 4
              },
              "wind": {
                "speed": 3.18,
                "deg": 271,
                "gust": 7.82
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-17 03:00:00"
            },
            {
              "dt": 1742191200,
              "main": {
                "temp": -1.06,
                "feels_like": -5.47,
                "temp_min": -1.06,
                "temp_max": -1.06,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 977,
                "humidity": 97,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 600,
                  "main": "Snow",
                  "description": "light snow",
                  "icon": "13d"
                }
              ],
              "clouds": {
                "all": 53
              },
              "wind": {
                "speed": 3.84,
                "deg": 336,
                "gust": 9.79
              },
              "visibility": 826,
              "pop": 0.58,
              "snow": {
                "3h": 0.58
              },
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-17 06:00:00"
            },
            {
              "dt": 1742202000,
              "main": {
                "temp": -2.07,
                "feels_like": -8.86,
                "temp_min": -2.07,
                "temp_max": -2.07,
                "pressure": 1019,
                "sea_level": 1019,
                "grnd_level": 980,
                "humidity": 80,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 600,
                  "main": "Snow",
                  "description": "light snow",
                  "icon": "13d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 7.63,
                "deg": 13,
                "gust": 11.02
              },
              "visibility": 3938,
              "pop": 1,
              "snow": {
                "3h": 1.08
              },
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-17 09:00:00"
            },
            {
              "dt": 1742212800,
              "main": {
                "temp": -0.45,
                "feels_like": -7.06,
                "temp_min": -0.45,
                "temp_max": -0.45,
                "pressure": 1020,
                "sea_level": 1020,
                "grnd_level": 982,
                "humidity": 55,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 600,
                  "main": "Snow",
                  "description": "light snow",
                  "icon": "13d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 8.39,
                "deg": 3,
                "gust": 10.29
              },
              "visibility": 10000,
              "pop": 1,
              "snow": {
                "3h": 0.18
              },
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-17 12:00:00"
            },
            {
              "dt": 1742223600,
              "main": {
                "temp": -1.63,
                "feels_like": -8.26,
                "temp_min": -1.63,
                "temp_max": -1.63,
                "pressure": 1023,
                "sea_level": 1023,
                "grnd_level": 985,
                "humidity": 58,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 600,
                  "main": "Snow",
                  "description": "light snow",
                  "icon": "13d"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 7.57,
                "deg": 11,
                "gust": 10.86
              },
              "visibility": 10000,
              "pop": 0.83,
              "snow": {
                "3h": 0.44
              },
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-17 15:00:00"
            },
            {
              "dt": 1742234400,
              "main": {
                "temp": -3.2,
                "feels_like": -8.66,
                "temp_min": -3.2,
                "temp_max": -3.2,
                "pressure": 1026,
                "sea_level": 1026,
                "grnd_level": 987,
                "humidity": 59,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 804,
                  "main": "Clouds",
                  "description": "overcast clouds",
                  "icon": "04n"
                }
              ],
              "clouds": {
                "all": 85
              },
              "wind": {
                "speed": 4.61,
                "deg": 12,
                "gust": 11.23
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-17 18:00:00"
            },
            {
              "dt": 1742245200,
              "main": {
                "temp": -3.79,
                "feels_like": -8.81,
                "temp_min": -3.79,
                "temp_max": -3.79,
                "pressure": 1028,
                "sea_level": 1028,
                "grnd_level": 990,
                "humidity": 63,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 800,
                  "main": "Clear",
                  "description": "clear sky",
                  "icon": "01n"
                }
              ],
              "clouds": {
                "all": 5
              },
              "wind": {
                "speed": 3.84,
                "deg": 346,
                "gust": 10.69
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-17 21:00:00"
            },
            {
              "dt": 1742256000,
              "main": {
                "temp": -3.95,
                "feels_like": -9.44,
                "temp_min": -3.95,
                "temp_max": -3.95,
                "pressure": 1029,
                "sea_level": 1029,
                "grnd_level": 990,
                "humidity": 68,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 801,
                  "main": "Clouds",
                  "description": "few clouds",
                  "icon": "02n"
                }
              ],
              "clouds": {
                "all": 16
              },
              "wind": {
                "speed": 4.4,
                "deg": 332,
                "gust": 10.43
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-18 00:00:00"
            },
            {
              "dt": 1742266800,
              "main": {
                "temp": -3.92,
                "feels_like": -9.45,
                "temp_min": -3.92,
                "temp_max": -3.92,
                "pressure": 1031,
                "sea_level": 1031,
                "grnd_level": 992,
                "humidity": 84,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 800,
                  "main": "Clear",
                  "description": "clear sky",
                  "icon": "01n"
                }
              ],
              "clouds": {
                "all": 9
              },
              "wind": {
                "speed": 4.47,
                "deg": 344,
                "gust": 10.02
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-18 03:00:00"
            },
            {
              "dt": 1742277600,
              "main": {
                "temp": -3.3,
                "feels_like": -8.54,
                "temp_min": -3.3,
                "temp_max": -3.3,
                "pressure": 1032,
                "sea_level": 1032,
                "grnd_level": 993,
                "humidity": 81,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 800,
                  "main": "Clear",
                  "description": "clear sky",
                  "icon": "01d"
                }
              ],
              "clouds": {
                "all": 9
              },
              "wind": {
                "speed": 4.27,
                "deg": 346,
                "gust": 8.05
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-18 06:00:00"
            },
            {
              "dt": 1742288400,
              "main": {
                "temp": -0.08,
                "feels_like": -4.63,
                "temp_min": -0.08,
                "temp_max": -0.08,
                "pressure": 1033,
                "sea_level": 1033,
                "grnd_level": 994,
                "humidity": 53,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 801,
                  "main": "Clouds",
                  "description": "few clouds",
                  "icon": "02d"
                }
              ],
              "clouds": {
                "all": 15
              },
              "wind": {
                "speed": 4.37,
                "deg": 360,
                "gust": 6.23
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-18 09:00:00"
            },
            {
              "dt": 1742299200,
              "main": {
                "temp": 1.87,
                "feels_like": -2.11,
                "temp_min": 1.87,
                "temp_max": 1.87,
                "pressure": 1032,
                "sea_level": 1032,
                "grnd_level": 994,
                "humidity": 42,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 803,
                  "main": "Clouds",
                  "description": "broken clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 58
              },
              "wind": {
                "speed": 4.19,
                "deg": 349,
                "gust": 5.38
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-18 12:00:00"
            },
            {
              "dt": 1742310000,
              "main": {
                "temp": 1.63,
                "feels_like": -2.14,
                "temp_min": 1.63,
                "temp_max": 1.63,
                "pressure": 1032,
                "sea_level": 1032,
                "grnd_level": 994,
                "humidity": 49,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 804,
                  "main": "Clouds",
                  "description": "overcast clouds",
                  "icon": "04d"
                }
              ],
              "clouds": {
                "all": 90
              },
              "wind": {
                "speed": 3.79,
                "deg": 342,
                "gust": 5.58
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "d"
              },
              "dt_txt": "2025-03-18 15:00:00"
            },
            {
              "dt": 1742320800,
              "main": {
                "temp": -2.1,
                "feels_like": -5.05,
                "temp_min": -2.1,
                "temp_max": -2.1,
                "pressure": 1034,
                "sea_level": 1034,
                "grnd_level": 995,
                "humidity": 64,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 802,
                  "main": "Clouds",
                  "description": "scattered clouds",
                  "icon": "03n"
                }
              ],
              "clouds": {
                "all": 50
              },
              "wind": {
                "speed": 2.11,
                "deg": 308,
                "gust": 2.09
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-18 18:00:00"
            },
            {
              "dt": 1742331600,
              "main": {
                "temp": -2.51,
                "feels_like": -6.19,
                "temp_min": -2.51,
                "temp_max": -2.51,
                "pressure": 1034,
                "sea_level": 1034,
                "grnd_level": 995,
                "humidity": 65,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 800,
                  "main": "Clear",
                  "description": "clear sky",
                  "icon": "01n"
                }
              ],
              "clouds": {
                "all": 10
              },
              "wind": {
                "speed": 2.68,
                "deg": 283,
                "gust": 3.16
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-18 21:00:00"
            },
            {
              "dt": 1742342400,
              "main": {
                "temp": -2.83,
                "feels_like": -6.88,
                "temp_min": -2.83,
                "temp_max": -2.83,
                "pressure": 1034,
                "sea_level": 1034,
                "grnd_level": 996,
                "humidity": 66,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 801,
                  "main": "Clouds",
                  "description": "few clouds",
                  "icon": "02n"
                }
              ],
              "clouds": {
                "all": 23
              },
              "wind": {
                "speed": 2.98,
                "deg": 279,
                "gust": 7.08
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-19 00:00:00"
            },
            {
              "dt": 1742353200,
              "main": {
                "temp": -2.07,
                "feels_like": -6.14,
                "temp_min": -2.07,
                "temp_max": -2.07,
                "pressure": 1035,
                "sea_level": 1035,
                "grnd_level": 996,
                "humidity": 67,
                "temp_kf": 0
              },
              "weather": [
                {
                  "id": 804,
                  "main": "Clouds",
                  "description": "overcast clouds",
                  "icon": "04n"
                }
              ],
              "clouds": {
                "all": 100
              },
              "wind": {
                "speed": 3.16,
                "deg": 283,
                "gust": 8
              },
              "visibility": 10000,
              "pop": 0,
              "sys": {
                "pod": "n"
              },
              "dt_txt": "2025-03-19 03:00:00"
            }
          ],
          "city": {
            "id": 702550,
            "name": "Lviv",
            "coord": {
              "lat": 49.8383,
              "lon": 24.0232
            },
            "country": "UA",
            "population": 15000,
            "timezone": 7200,
            "sunrise": 1741927189,
            "sunset": 1741969592
          }
        }
        """

struct ForecastResponce: Codable {
    struct Main: Codable {
        let temp: Double
    }
    struct Forecast: Codable {
        let main: Main
        let dt: TimeInterval
    }
    let list: [Forecast]
}

//guard let data = jsonString.data(using: .utf8) else {
//    print("corrupted string!")
//    exit(1)
//}

//let responce = try? JSONDecoder().decode(ForecastResponce.self, from: data)

extension ForecastResponce.Forecast: CustomStringConvertible {
    var description: String {
        "date: \(Date(timeIntervalSince1970: dt)), temp: \(main.temp)"
    }
}
//print(responce)
