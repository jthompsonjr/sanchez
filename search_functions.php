<?php
/*  Sanchez Fulltext Search Functions*/
/*  Sara Somabhatta                     */

function search_paginate($start, $total, $results_per_page, $sort_string)
{
        // Set start to be divisible by results per page
        if (($start % $results_per_page) != 0) {
                $start = $start - ($start % $results_per_page);
        }

        //Find last page of results to use for Last Page button
        $last_page = (ceil($total/$results_per_page) * $results_per_page) - $results_per_page;

        print " <div class=\"pagination\">\n";

        //Previous
        if ($start >= $results_per_page) {
                $prev_start = $start - $results_per_page;
                print "<a href=\"sanchez-search.php?start=".$prev_start."&amp;query=".$sort_string."\">";
                print "Prev</a>\n";
        }



        //Page Numbers
        print "<span class=\"pagination-numbers\">\n";

        //first page
        if ($start < $results_per_page) {
	 print  "<span id=\"currentpage\">1</span>&nbsp;\n";
                $i = $start;

                while (($i + $results_per_page < $total) && (($i + $results_per_page) < ($results_per_page * 5))) {
                        $i+=$results_per_page;
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                        print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>&nbsp;\n";
                }
                if (ceil($total/$results_per_page) > 5) {
                        print "...&nbsp;";
                        print "<a href=\"sanchez-search.php?start=".$last_page."&amp;query=".$sort_string."\">".ceil($total/$results_per_page)."</a>&nbsp;\n";
                }

        // second page
        } else if ($start < ($results_per_page * 2)) {
                print  "<a href=\"sanchez-search.php?query=".$sort_string."\">1</a>&nbsp;\n";
                print "<span id=\"currentpage\">2</span>&nbsp;\n";

                $i = $start;

                while (($i + $results_per_page < $total) && (($i + $results_per_page) < ($results_per_page * 5))) {
                        $i+=$results_per_page;
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                        print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                        print "&nbsp;\n";
                }
                if (ceil($total/$results_per_page) > 5) {
                        print "...&nbsp;";
                        print "<a href=\"sanchez-search.php?start=".$last_page."&amp;query=".$sort_string."\">".ceil($total/$results_per_page)."</a>";
                        print "&nbsp;\n";
                }

        // last page
        } else if ($start + $results_per_page >= $total) {
                if (ceil($total/$results_per_page) > 5) {
                        print "<a href=\"sanchez-search.php?start=0&amp;query=".$sort_string."\">1</a>\n";
                        print "&nbsp;...&nbsp;";
                }
                // page five from last
                if ($start - ($results_per_page * 4) >= 0) {
                        $i = $start - ($results_per_page * 4);
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                        if ($i != 0) {
                                print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                                print "&nbsp;\n";
                        } else {
                                print "<a href=\"sanchez-search.php?start=&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                                print "&nbsp;\n";
                        }
                }
                // page four from last
                if ($start - ($results_per_page * 3) >= 0) {
                        $i = $start - ($results_per_page * 3);
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                        if ($i != 0) {
                                print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                                print "&nbsp;\n";
                        } else {
                                print "<a href=\"sanchez-search.php?start=&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                                print "&nbsp;\n";
                        }
                }
                 
                // page three from last
                if ($start - ($results_per_page * 2) >= 0) {
                        $i = $start - ($results_per_page * 2);
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                        if ($i != 0) {
                                print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                                print "&nbsp;\n";
                        } else {
                                print "<a href=\"sanchez-search.php?query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                                print "&nbsp;\n";
                        }
                }
                // page one from last
                if ($start - $results_per_page >= 0) {
                        $i = $start - $results_per_page;
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                        print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                        print "&nbsp;\n";
                }
                // last page
               //  print "<span id=\"currentpage\">".ceil($total/$results_per_page)."</span>";
               //  print "&nbsp;\n";

        // all middle pages
        } else {
                if (ceil($total/$results_per_page) > 5) {
                        print "<a href=\"sanchez-search.php?start=0&amp;query=".$sort_string."\">1</a>";
                        print "&nbsp;\n";
                        if ($start - ($results_per_page * 2) != 0) {
                                print "...&nbsp;\n";
                        }
                }
                if (($start - ($results_per_page * 3) >= 0) && ($start + ($results_per_page * 2) >= $total))  {
                        $i = $start - ($results_per_page * 3);
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                        if ($i != 0) {
                                print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                                print "&nbsp;\n";
                        }
                }
                // page 2 previous to current
                if ($start - ($results_per_page * 2) >= 0) {
                        $i = $start - ($results_per_page * 2);
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                        if ($i != 0) {
                                print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                                print "&nbsp;\n";
                        } else if (ceil($total/$results_per_page) == 4) {

                                print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                                print "&nbsp;\n";
                        }
                }
                // page 1 previous to current
                if ($start - $results_per_page >= 0) {
                        $i = $start - $results_per_page;
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                        print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                        print "&nbsp;\n";
                }
                // current page
                $i = $start;
                $prev1 = $i + 1;
                $next1 = $i + $results_per_page;
                $next1 = min($next1, $total);
                // page immediately after current
                if ($start + ($results_per_page * 2) < $total) {
                        $i = $start + $results_per_page;
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                print "<span id=\"currentpage\">".ceil($next1/$results_per_page)."</span>";
                print "&nbsp;\n";
                        print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                        print "&nbsp;\n";
                }
                // page 2 after current
                if (($start + $results_per_page < $total) && ($start + ($results_per_page * 3) < $total)) {
                        $i = $start + ($results_per_page * 2);
                        $prev1 = $i + 1;
                        $next1 = $i + $results_per_page;
                        $next1 = min($next1, $total);
                        print "<a href=\"sanchez-search.php?start=".$i."&amp;query=".$sort_string."\">".ceil($next1/$results_per_page)."</a>";
                        print "&nbsp;\n";
                }
                // last page
                if ((ceil($total/$results_per_page) > 5) || (ceil($total/$results_per_page) == 4)) {
                        if ( ($start + $results_per_page < $total) && ($start + ($results_per_page * 4) < $total) ) {
                                print "...&nbsp;";
                        }
                        print "<a href=\"sanchez-search.php?start=".$last_page."&amp;query=".$sort_string."\">".ceil($total/$results_per_page)."</a>";
                        print "&nbsp;\n";
                }
        }
        print "</span>\n";

        //Next
        if ($start + $results_per_page < $total) {
                $next_start = $start + $results_per_page;
                print "<a href=\"sanchez-search.php?start=".$next_start."&amp;query=".$sort_string."\">";
                print "Next</a>\n";
        }




        print "</div>\n";
}


function casttoclass($class, $object)
       {
        return unserialize(preg_replace('/O:8:"stdClass"/', 'O:' . strlen($class) . ':"' . $class . '"', serialize($object)));
       }

?>

