public class Anablend : Gst.Base.Transform
{
    protected static Gst.StaticCaps sink_caps = {
        null,
        """video/x-raw"""
    };
    protected static Gst.StaticCaps src_caps = {
        null,
        """video/x-raw"""
    };
    protected static Gst.StaticPadTemplate sink_template = {
        "sink",
        Gst.PadDirection.SINK,
        Gst.PadPresence.REQUEST,
        sink_caps
    };
    protected static Gst.StaticPadTemplate src_template = {
        "src",
        Gst.PadDirection.SRC,
        Gst.PadPresence.ALWAYS,
        src_caps
    };

    static construct {
        set_static_metadata (
        "anablend",
        "Filter",
        "Blends two video streams to make an anaglyphic video.",
        "github.com/albert-tomanek");

        var arr = Mu.zeros({1, 2});

        add_static_pad_template (sink_template);
        add_static_pad_template (src_template);
    }

    uint counter = 0;

    public override Gst.FlowReturn transform_ip (Gst.Buffer buf) {
        stdout. printf("Frame # %u", counter);
        counter += 1;
        return Gst.FlowReturn.OK;
    }
}

public static bool plugin_init (Gst.Plugin p)
{
    Gst.Element.register (p, "anablend", Gst.Rank.NONE, typeof(Anablend));
    return true;
}

const Gst.PluginDesc gst_plugin_desc = {
    1, 20,
    "anablend",
    "Anaglyph creator element",
    plugin_init,
    "0.1",
    "MIT",
    "https://github.com/albert-tomanek/gstanablend",
    "anablend",
    "https://github.com/albert-tomanek/gstanablend",
    null
};