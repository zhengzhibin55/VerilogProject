
 add_fsm_encoding \
       {ad1.state} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0010} {0011 0011} {0100 0100} {0101 0101} {0110 0110} {0111 0111} {1000 1000} {1001 1001} {1010 1010} {1011 1011} {1100 1100} {1101 1101} {1110 1110} }

 add_fsm_encoding \
       {ad2.state} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0010} {0011 0011} {0100 0100} {0101 0101} {0110 0110} {0111 0111} {1000 1000} {1001 1001} {1010 1010} {1011 1011} {1100 1100} {1101 1101} {1110 1110} }

 add_fsm_encoding \
       {wr_chnl.GEN_WDATA_SM_NO_ECC_DUAL_REG_WREADY.wr_data_sm_cs} \
       { }  \
       {{000 000} {001 100} {010 011} {011 001} {100 010} }

 add_fsm_encoding \
       {rd_chnl.rlast_sm_cs} \
       { }  \
       {{000 000} {001 010} {010 011} {011 100} {100 001} }

 add_fsm_encoding \
       {axi_dynclk.clk_state} \
       { }  \
       {{000 00001} {001 00010} {010 00100} {011 01000} {100 10000} }

 add_fsm_encoding \
       {axi_vdma_sm.dmacntrl_cs} \
       { }  \
       {{000 000} {001 001} {010 010} {011 101} {100 011} {101 100} }

 add_fsm_encoding \
       {axi_data_fifo_v2_1_6_axic_reg_srl_fifo.state} \
       { }  \
       {{00 0100} {01 1000} {10 0001} {11 0010} }

 add_fsm_encoding \
       {v_axi4s_vid_out_v4_0_1_sync.state} \
       { }  \
       {{0000 0000} {0001 0010} {0010 0001} {0011 0100} {0100 0101} {0101 0110} {0110 0111} {0111 0011} {1000 1000} {1001 1001} {1010 1010} {1011 1011} {1100 1100} }
