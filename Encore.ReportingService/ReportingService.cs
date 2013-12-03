using System;
using System.Configuration;
using System.ServiceProcess;
using System.Timers;

using Encore.TaskManager;

namespace Encore.ReportingService
{
    public partial class ReportingService : ServiceBase
    {
        private const string LogSource = "ReportingService";

        private Timer timer;
        private int lastSummaryDay = 0; 
        public ReportingService()
        {
            InitializeComponent();
        }

        /// <summary>
        /// start the service
        /// </summary>
        /// <param name="args"></param>
        protected override void OnStart(string[] args)
        {
            Log.Write(LogSource, "Service Started");
            try
            {
                var interval = int.Parse(ConfigurationSettings.AppSettings["interval"]);

                timer = new System.Timers.Timer(interval);
                timer.Elapsed += TimerElapsed;
                timer.Start();

                Log.Write(LogSource, string.Format("Timer started at {0} millisecond interval", interval));
            }
            catch (Exception ex)
            {
                Log.Write(ex);
            }
        }

        /// <summary>
        /// Timer has elapsed - check for reports to process
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void TimerElapsed(object sender, ElapsedEventArgs e)
        {
            Log.Write(LogSource, "Timer elapsed - processing queue");
            var manager = new TaskManager.TaskManager();

            try
            {
                if (DateTime.Now.Hour == int.Parse(ConfigurationSettings.AppSettings["summaryhour"]) &&
                    DateTime.Now.Day != lastSummaryDay)
                {
                    lastSummaryDay = DateTime.Now.Day;

                    Log.Write(LogSource, "Getting project summary data");
                    manager.SyncProjectSummaries();    
                }

                // process queue
                manager.ProcessReportQueue();
            }
            catch (Exception ex)
            {
                Log.Write(ex);
            }
        }

        /// <summary>
        /// stop the service
        /// </summary>
        protected override void OnStop()
        {
            try
            {
                Log.Write(LogSource, "Stopping Timer");

                timer.Stop();
                timer.Elapsed -= TimerElapsed;
                timer.Dispose();
                Log.Write(LogSource, "Service Stopped");
            }
            catch (Exception ex)
            {
                Log.Write(ex);
            }
        }
    }
}
