
-------------------------------------------------------
used dependencys :   provider: ^6.0.2 ,  http: ^0.13.3
-------------------------------------------------------


API part :
API : https://google-search3.p.rapidapi.com/api/v1/search/q=$query

used heders 
 'x-user-agent': 'desktop',
          'x-proxy-location': 'EU',
          'x-rapidapi-host': 'google-search3.p.rapidapi.com',
          'x-rapidapi-key': '51f128af92msh1a57f3630f606fcp12c3f8jsn8b7a3a764---'

query comes from textfield

----------------------------------------------------------------------
coming to UI part 

here i design simple UI for searc in google 
Scaffold----
         |
         |
                  -------appbar ---
                                  row---
                                        |
                                        text
                                        icon
         |
         |
         --------body----
                      |
                      -------Column
                               |
                               -------newteorkimage
                               -------text field
                               --------raised button
                               -------- listview builder 
