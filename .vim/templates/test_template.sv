module __FILENAME__;

  reg clk;

  __MODULE__ dut(.*);

  // clock
  initial begin
    clk = 0;
    forever
      #(STEP/2) clk = ~clk;
  end

//==========================================================
// scenario
//==========================================================
// {{{

  initial begin

    $finish();
  end

// }}}
//==========================================================
// tasks
//==========================================================
// {{{

// }}}
//==========================================================
// models
//==========================================================
// {{{

// }}}
//==========================================================
// display
//==========================================================
// {{{

  initial begin
    $display("### __FILENAME__");
    forever begin
      #(STEP/2-1);
      $display(
        "%d: ", $time/STEP,
        "| ",

        "|"
      );
      #(STEP/2+1);
    end
  end

// }}}
endmodule
