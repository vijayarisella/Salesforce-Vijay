trigger realTimeUpdateIntegration  on Account (after update) {

    AccountUpdateIntegration.runJob('your_username_here','your_password_here','Integration Task Name Here','Type of task - see below...');

    /* 
    Type of task or taskflow. Use one of the following options:
    DLS. Data Loader task.
    DSS. Data Synchronization task.
    DRS. Data Replication task.
    DQA. Data Assessment task.
    PCS. PowerCenter task.
    DNB. D&B360 batch.
    Workflow. Task flow.
    */
}