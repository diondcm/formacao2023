unit Classe.BlockChain;

interface

type
  TSpendingOutpoints = class
  public
    n: Integer;
    tx_index: Int64;
  end;

  TPrevOut = class
  public
    n: Integer;
    script: string;
    spending_outpoints: array of TSpendingOutpoints;
    spent: Boolean;
    tx_index: Int64;
    _type: Integer;
    value: Int64;
  end;

  TInputs = class
  public
    sequence: Int64;
    witness: string;
    script: string;
    index: Integer;
    prev_out: TPrevOut;
  end;

  TOut = class
  public
    _type: Integer;
    spent: Boolean;
    value: Int64;
    spending_outpoints: array of TSpendingOutpoints;
    n: Integer;
    tx_index: Int64;
    script: string;
    addr: string;
  end;

  TTx = class
  public
    hash: string;
    ver: Integer;
    vin_sz: Integer;
    vout_sz: Integer;
    size: Integer;
    weight: Integer;
    fee: Integer;
    relayed_by: string;
    lock_time: Integer;
    tx_index: Int64;
    double_spend: Boolean;
    time: Int64;
    block_index: Integer;
    block_height: Integer;
    inputs: array of TInputs;
    out: array of TOut;
  end;

  TBlock = class
  public
    hash: string;
    ver: Integer;
    prev_block: string;
    mrkl_root: string;
    time: Int64;
    bits: Integer;
    next_block: array of string;
    fee: Integer;
    nonce: Int64;
    n_tx: Integer;
    size: Integer;
    block_index: Integer;
    main_chain: Boolean;
    height: Integer;
    weight: Integer;
    tx: array of TTx;
  end;


implementation

end.
