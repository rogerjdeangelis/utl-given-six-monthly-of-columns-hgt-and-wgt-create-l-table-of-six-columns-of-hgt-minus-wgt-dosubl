%let pgm=utl-given-six-monthly-of-columns-hgt-and-wgt-create-l-table-of-six-columns-of-hgt-minus-wgt-dosubl;

Given six monthly of columns hgt and wgt create l table of six columns of hgt minus wgt dosubl

github
https://tinyurl.com/3j3yt4bs
https://github.com/rogerjdeangelis/utl-given-six-monthly-of-columns-hgt-and-wgt-create-l-table-of-six-columns-of-hgt-minus-wgt-dosubl

dosubl repos on end

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

see
https://goo.gl/TB4Tej
https://communities.sas.com/t5/Base-SAS-Programming/how-to-merge-output-of-different-data-set-column-differences-in/m-p/355913

/**************************************************************************************************************************/
/*                                       |                                      |                                         */
/*           INPUT                       |            PROCESS                   |               OUTPUT                    */
/*                                       |                                      |                                         */
/*                                       |                                      |                                         */
/*  data  Jan Feb Mar                    |  Consider FEB input                  |  JAN total obs=3                        */
/*        Apr May Jun;                   |                                      |                                         */
/*  set sashelp.class(obs=18);           |  FEB total obs=3                     |  JAN    FEB*   MAR    APR    MAY    JUN */
/*  hgt=round(height);                   |                                      |                                         */
/*  wgt=round(weight);                   |  Obs    HGT    WGT                   |   44     40     25     41     21     63 */
/*  select ;                             |                                      |   27     39     50      0     45     66 */
/*    when ( 1<=_n_ <=3 )   output JAN;  |   1      63    103                   |   33     26     21     26     78     27 */
/*    when ( 4<=_n_ <=6 )   output FEB;  |   2      64    103                   |                                         */
/*    when ( 7<=_n_ <=9 )   output MAR;  |   3      57     83                   |  * see process                          */
/*    when ( 10<=_n_ <=12 ) output APR;  |                                      |                                         */
/*    when ( 13<=_n_ <=15 ) output MAY;  |  The output will have a              |                                         */
/*    when ( 16<=_n_ <=18 ) output JUN;  |  FEB column wgt-hgt                  |                                         */
/*    otherwise;                         |                                      |                                         */
/*  end;                                 |   FEB                                |                                         */
/*  keep hgt wgt;                        |                                      |                                         */
/*  run;quit;                            |    40  = 103-63                      |                                         */
/*                                       |    39  = 103-64                      |                                         */
/*  NOTE: The data set WORK.JAN          |    26  =  83-57                      |                                         */
/*  NOTE: The data set WORK.FEB          |                                      |                                         */
/*  NOTE: The data set WORK.MAR          |  SOLUTION                            |                                         */
/*  NOTE: The data set WORK.APR          |                                      |                                         */
/*  NOTE: The data set WORK.MAY          |  data _null_;                        |                                         */
/*  NOTE: The data set WORK.JUN          |     do mon=  "Jan", "Feb", "Mar"     |                                         */
/*                                       |             ,"Apr", "May", "Jun";    |                                         */
/*  Example of FEB input                 |       call symputx('mon',mon);       |                                         */
/*                                       |       rc=dosubl('                    |                                         */
/*  FEB total obs=3                      |           data jan;                  |                                         */
/*                                       |             merge jan &mon(in=mon);  |                                         */
/*  Obs    HGT    WGT                    |             if mon;                  |                                         */
/*                                       |             &mon=wgt-hgt;            |                                         */
/*   1      63    103                    |             drop hgt wgt;            |                                         */
/*   2      64    103                    |           run;quit;                  |                                         */
/*   3      57     83                    |       ');                            |                                         */
/*                                       |     end;                             |                                         */
/*                                       |  run;quit;                           |                                         */
/*                                       |                                      |                                         */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

 data  Jan Feb Mar
       Apr May Jun;
 set sashelp.class(obs=18);
 hgt=round(height);
 wgt=round(weight);
 select ;
   when ( 1<=_n_ <=3 )   output JAN;
   when ( 4<=_n_ <=6 )   output FEB;
   when ( 7<=_n_ <=9 )   output MAR;
   when ( 10<=_n_ <=12 ) output APR;
   when ( 13<=_n_ <=15 ) output MAY;
   when ( 16<=_n_ <=18 ) output JUN;
   otherwise;
 end;
 keep hgt wgt;
 run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  NOTE: The data set WORK.JAN                                                                                           */
/*  NOTE: The data set WORK.FEB                                                                                           */
/*  NOTE: The data set WORK.MAR                                                                                           */
/*  NOTE: The data set WORK.APR                                                                                           */
/*  NOTE: The data set WORK.MAY                                                                                           */
/*  NOTE: The data set WORK.JUN                                                                                           */
/*                                                                                                                        */
/*  SAMPLES                                                                                                               */
/*                                                                                                                        */
/*  JAN total obs=3                                                                                                       */
/*                                                                                                                        */
/*  HGT    WGT  (JAN COLUMN OUTPUT)                                                                                       */
/*                                                                                                                        */
/*   69    113   44 = 113-69                                                                                              */
/*   57     84   27 =  84-57                                                                                              */
/*   65     98   33 =  98-65                                                                                              */
/*                                                                                                                        */
/*  FEB total obs=3                                                                                                       */
/*                                                                                                                        */
/*  HGT    WGT   (FEB COLUMN OUTPUT)                                                                                      */
/*                                                                                                                        */
/*   63    103   40  = 103-63                                                                                             */
/*   64    103   39  = 103-64                                                                                             */
/*   57     83   26  =  83-57                                                                                             */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

data _null_;
   do mon=  "Jan", "Feb", "Mar"
           ,"Apr", "May", "Jun";
     call symputx('mon',mon);
     rc=dosubl('
         data jan;
           merge jan &mon(in=mon);
           if mon;
           &mon=wgt-hgt;
           drop hgt wgt;
         run;quit;
     ');
   end;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                                                                                                        */
/*  Obs    JAN    FEB    MAR    APR    MAY    JUN                                                                         */
/*                                                                                                                        */
/*   1      44     40     25     41     21     63                                                                         */
/*   2      27     39     50      0     45     66                                                                         */
/*   3      33     26     21     26     78     27                                                                         */
/*                                                                                                                        */
/**************************************************************************************************************************/

REPO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
https://github.com/rogerjdeangelis/-utl-delete-dosubl-created-sas-macro-libraries
https://github.com/rogerjdeangelis/Dynamic_variable_in_a_DOSUBL_execute_macro_in_SAS
https://github.com/rogerjdeangelis/utl-DOSUBL-running-sql-inside-a-datastep-to-check-if-variables-exist-in-another-table
https://github.com/rogerjdeangelis/utl-No-need-to-convert-your-datastep-code-to-macro-code-use-DOSUBL
https://github.com/rogerjdeangelis/utl-a-better-call-execute-using-dosubl
https://github.com/rogerjdeangelis/utl-academic-pipes-dosubl-open-defer-and-dropping-dowm-to-multiple-languages-in-one-datastep
https://github.com/rogerjdeangelis/utl-adding-female-students-to-an-all-male-math-class-using-sql-insert_and_dosubl
https://github.com/rogerjdeangelis/utl-adding-summary-statistics-to-your-datastep-input-table-macro-dosubl
https://github.com/rogerjdeangelis/utl-append-and-split-tables-into-two-tables-one-with-common-variables-and-one-without-dosubl-hash
https://github.com/rogerjdeangelis/utl-applying-meta-data-and-dosubl-to-create-mutiple-subset-tables
https://github.com/rogerjdeangelis/utl-cleaner-macro-code-using-dosubl
https://github.com/rogerjdeangelis/utl-dosubl-a-more-powerfull-macro-sysfunc-command
https://github.com/rogerjdeangelis/utl-dosubl-and-do-over-as-alternatives-to-explicit-macros
https://github.com/rogerjdeangelis/utl-dosubl-more-precise-eight-byte-float-computations-at-macro-excecution-time
https://github.com/rogerjdeangelis/utl-dosubl-persistent-hash-across-datasteps-and-procedures
https://github.com/rogerjdeangelis/utl-dosubl-remove-text-within-parentheses-of-macro-variable-using-regex
https://github.com/rogerjdeangelis/utl-dosubl-using-meta-data-with-column-names-and-labels-to-create-mutiple-proc-reports
https://github.com/rogerjdeangelis/utl-drop-down-using-dosubl-from-sas-datastep-to-wps-r-perl-powershell-python-msr-vb
https://github.com/rogerjdeangelis/utl-embed-sql-code-inside-proc-report-using-dosubl
https://github.com/rogerjdeangelis/utl-embedding-dosubl-in-a-macro-and-returning-an-updated-environment-variable-contents
https://github.com/rogerjdeangelis/utl-error-checking-sql-and-executing-a-datastep-inside-sql-dosubl
https://github.com/rogerjdeangelis/utl-extracting-sas-meta-data-using-sas-macro-fcmp-and-dosubl
https://github.com/rogerjdeangelis/utl-get-dataset-attributes-at-macro-time-within-a-datastep-using-attrn-dosubl-macros
https://github.com/rogerjdeangelis/utl-in-memory-hash-output-shared-with-dosubl-hash-subprocess
https://github.com/rogerjdeangelis/utl-let-dosubl-and-the-sas-interpreter-work-for-you
https://github.com/rogerjdeangelis/utl-load-configuation-variable-assignments-into-an-sas-array-macro-and-dosubl
https://github.com/rogerjdeangelis/utl-loop-through-one-table-and-find-data-in-next-table--hash-dosubl-arts-transpose
https://github.com/rogerjdeangelis/utl-macro-klingon-solution-or-simple-dosubl-you-decide
https://github.com/rogerjdeangelis/utl-macro-with-dosubl-to-compute-last-day-of-month
https://github.com/rogerjdeangelis/utl-maitainable-macro-function-code-using-dosubl
https://github.com/rogerjdeangelis/utl-passing-a-datastep-array-to-dosubl-squaring-the-elements-passing-array-back-to-parent
https://github.com/rogerjdeangelis/utl-potentially-useful-dosubl-interface
https://github.com/rogerjdeangelis/utl-re-ordering-variables-into-alphabetic-order-in-the-pdv-macros-dosubl
https://github.com/rogerjdeangelis/utl-rename-variables-with-the-same-prefix-dosubl-varlist
https://github.com/rogerjdeangelis/utl-sas-array-macro-fcmp-or-dosubl-take-your-choice
https://github.com/rogerjdeangelis/utl-select-high-payment-periods-and-generating-code-with-do_over-and-dosubl
https://github.com/rogerjdeangelis/utl-some-interesting-applications-of-dosubl
https://github.com/rogerjdeangelis/utl-transpose-multiple-rows-into-one-row-do_over-dosubl-and-varlist-macros
https://github.com/rogerjdeangelis/utl-twelve-interfaces-for-dosubl
https://github.com/rogerjdeangelis/utl-use-dosubl-to-save-your-format-code-inside-proc-report
https://github.com/rogerjdeangelis/utl-using-dosubl-and-a-dynamic-arrays-to-add-new-variables
https://github.com/rogerjdeangelis/utl-using-dosubl-to-avoid-klingon-obsucated-macro-coding
https://github.com/rogerjdeangelis/utl-using-dosubl-to-avoid-macros-and-add-an-error-checking-log
https://github.com/rogerjdeangelis/utl-using-dosubl-to-exceute-r-for-each-row-in-a-dataset
https://github.com/rogerjdeangelis/utl-using-dosubl-with-data-driven-business-rules-to-split-a-table
https://github.com/rogerjdeangelis/utl-using-dynamic-tables-to-interface-with-dosubl
https://github.com/rogerjdeangelis/utl_avoiding_macros_and_call_execute_by_using_dosubl_with_log
https://github.com/rogerjdeangelis/utl_dosubl_do_regressions_when_data_is_between_dates
https://github.com/rogerjdeangelis/utl_dosubl_macros_to_select_max_value_of_a_column_at_datastep_execution_time
https://github.com/rogerjdeangelis/utl_dosubl_subroutine_interfaces
https://github.com/rogerjdeangelis/utl_dynamic_subroutines_dosubl_with_error_checking
https://github.com/rogerjdeangelis/utl_overcoming_serious_deficiencies_in_call_execute_with_dosubl
https://github.com/rogerjdeangelis/utl_pass_character_and_numeric_arrays_to_dosubl
https://github.com/rogerjdeangelis/utl_passing-in-memory-sas-objects-to-and-from-dosubl
https://github.com/rogerjdeangelis/utl_read_all_datasets_in_a_library_and_conditionally_split_them_with_error_checking_dosubl
https://github.com/rogerjdeangelis/utl_sharing_a_block_of_memory_with_dosubl
https://github.com/rogerjdeangelis/utl_using_dosubl_instead_of_a_macro_to_avoid_numeric_truncation
https://github.com/rogerjdeangelis/utl_using_dosubl_to_avoid_klingon_macro_quoting_functions
https://github.com/rogerjdeangelis/utl_why_proc_import_export_needs_to_be_deprecated_and_dosubl_acknowledged


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
