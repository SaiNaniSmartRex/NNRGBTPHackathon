const cds=require('@sap/cds')
module.exports = cds.service.impl(async function () {
    const { States, Businesspartner } = this.entities;
    this.on("READ", Businesspartner, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
    this.before("CREATE",  Businesspartner, async (req) => {
        const { bp_no, Is_gstn_registered, gstin_no } = req.data;


        if (Is_gstn_registered && !gstin_no) {
            req.error({
                code: "MISSING_GST_NUM",
                message: "GSTIN number is mandatory when Is_gstn_registered is true",
                target: "gstin_no",
            });
        }
        const query1 = SELECT.from( Businesspartner).where({ partnerid: req.data.partnerid });
        const result = await cds.run(query1);
        if (result.length > 0) {
          req.error({
            code: "STEMAILEXISTS",
            message: " already exists",
            target: "partnerid",
          });
        }
        
      });
      this.on('READ',States,async(req)=>{
        states=[
            {"code":"TS","description":"Telangana"},
            {"code":"AP","description":"Andra Pradesh"},
            {"code":"TN","description":"Tamil Nadu"},
        ]
        states.$count=states.length
        return states;
    })
})